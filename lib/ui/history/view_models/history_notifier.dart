import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/service_locator.dart';
import '../../../domain/entities/question_record.dart';
import '../../../domain/usecases/question/delete_question_use_case.dart';
import '../../../domain/usecases/question/get_question_page_use_case.dart';
import '../../../domain/usecases/question/observe_all_questions_use_case.dart';
import '../../../domain/usecases/question/toggle_bookmark_use_case.dart';
import '../state/history_state.dart';

final historyNotifierProvider = NotifierProvider<HistoryNotifier, HistoryState>(
  HistoryNotifier.new,
);

class HistoryNotifier extends Notifier<HistoryState> {
  late final ObserveAllQuestionsUseCase _observeAllQuestionsUseCase;
  late final GetQuestionPageUseCase _getQuestionPageUseCase;
  late final ToggleBookmarkUseCase _toggleBookmarkUseCase;
  late final DeleteQuestionUseCase _deleteQuestionUseCase;

  StreamSubscription<List<QuestionRecord>>? _questionsSubscription;
  List<QuestionRecord> _allQuestions = [];
  bool _initialized = false;

  // MARK: - Build
  @override
  HistoryState build() {
    _observeAllQuestionsUseCase = serviceLocator<ObserveAllQuestionsUseCase>();
    _getQuestionPageUseCase = serviceLocator<GetQuestionPageUseCase>();
    _toggleBookmarkUseCase = serviceLocator<ToggleBookmarkUseCase>();
    _deleteQuestionUseCase = serviceLocator<DeleteQuestionUseCase>();

    ref.onDispose(() {
      _questionsSubscription?.cancel();
    });

    if (!_initialized) {
      _initialized = true;
      Future.microtask(_init);
    }

    return const HistoryState(isInitialLoading: true);
  }

  // MARK: - 초기화
  void _init() {
    _subscribeToQuestions();
    _fetchInitial();
  }

  // MARK: - 초기 데이터 조회
  Future<void> _fetchInitial() async {
    try {
      final page = await _getQuestionPageUseCase();

      state = state.copyWith(
        nextCursor: page.nextCursor,
        hasNext: page.hasNext,
      );
    } catch (e) {
      debugPrint('fetch fail: $e');
    }
  }

  // MARK: - 질문 목록 구독
  void _subscribeToQuestions() {
    _questionsSubscription = _observeAllQuestionsUseCase().listen((questions) {
      _allQuestions = questions;
      _updateViewState();
    });
  }

  // MARK: - 추가 로드
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasNext) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final page = await _getQuestionPageUseCase(cursor: state.nextCursor);

      state = state.copyWith(
        nextCursor: page.nextCursor,
        hasNext: page.hasNext,
      );
    } finally {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  // MARK: - 필터 변경
  void changeFilter(HistoryFilter filter) {
    state = state.copyWith(filter: filter);
    _updateViewState();
  }

  // MARK: - 북마크 토글
  Future<void> toggleBookmark(int questionId) async {
    await _toggleBookmarkUseCase(questionId);
  }

  // MARK: - 질문 삭제
  Future<void> deleteQuestion(int questionId) async {
    await _deleteQuestionUseCase(questionId);
  }

  // MARK: - 화면 상태 갱신
  void _updateViewState() {
    final filteredQuestions = _filterQuestions(_allQuestions, state.filter);
    final questionsGroupedByYear = _groupQuestionsByYear(filteredQuestions);

    state = state.copyWith(
      groupedByYear: questionsGroupedByYear,
      isInitialLoading: false,
    );
  }

  // MARK: - 필터 적용
  List<QuestionRecord> _filterQuestions(
    List<QuestionRecord> questions,
    HistoryFilter filter,
  ) {
    switch (filter) {
      case HistoryFilter.bookmarked:
        return questions.where((q) => q.isBookmarked).toList();
      case HistoryFilter.all:
        return questions;
    }
  }

  // MARK: - 연도별 그룹화
  Map<int, List<QuestionRecord>> _groupQuestionsByYear(
    List<QuestionRecord> questions,
  ) {
    final result = <int, List<QuestionRecord>>{};

    for (final question in questions) {
      final year = question.createdAt.year;
      result.putIfAbsent(year, () => []).add(question);
    }

    return Map.fromEntries(
      result.entries.toList()..sort((a, b) => b.key.compareTo(a.key)),
    );
  }
}
