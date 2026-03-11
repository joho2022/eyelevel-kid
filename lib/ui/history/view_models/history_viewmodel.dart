import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../domain/entities/question_record.dart';
import '../../../domain/usecases/question/delete_question_use_case.dart';
import '../../../domain/usecases/question/get_question_page_use_case.dart';
import '../../../domain/usecases/question/observe_all_questions_use_case.dart';
import '../../../domain/usecases/question/toggle_bookmark_usecase.dart';
import '../state/history_state.dart';

class HistoryViewModel extends ChangeNotifier {
  final ObserveAllQuestionsUseCase observeAllQuestionsUseCase;
  final GetQuestionPageUseCase getQuestionPageUseCase;
  final ToggleBookmarkUseCase toggleBookmarkUseCase;
  final DeleteQuestionUseCase deleteQuestionUseCase;

  HistoryState state = const HistoryState();

  StreamSubscription<List<QuestionRecord>>? _questionsSubscription;

  List<QuestionRecord> _allQuestions = [];

  HistoryViewModel({
    required this.observeAllQuestionsUseCase,
    required this.getQuestionPageUseCase,
    required this.toggleBookmarkUseCase,
    required this.deleteQuestionUseCase,
  }) {
    print('히스토리뷰모델 초기화');
    _init();
  }

  // MARK: - 초기화
  void _init() {
    _subscribeToQuestions();
    _fetchInitial();
  }

  // MARK: - 초기 서버 fetch
  Future<void> _fetchInitial() async {
    try {
      final page = await getQuestionPageUseCase();

      state = state.copyWith(
        nextCursor: page.nextCursor,
        hasNext: page.hasNext,
      );

    } catch (e) {
      print("fetch fail: $e");
    }
  }

  // MARK: - 질문 목록 구독
  void _subscribeToQuestions() {
    print("==== 질문 구독 시작 ====");

    state = state.copyWith(isInitialLoading: true);
    notifyListeners();

    _questionsSubscription = observeAllQuestionsUseCase().listen((questions) {
      print("==== 질문 stream 들어옴 ====");
      print(questions);

      _allQuestions = questions;
      _updateViewState();
    });
  }

  // MARK: - 다음 페이지 로드
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasNext) return;

    state = state.copyWith(isLoadingMore: true);
    notifyListeners();

    try {
      final page = await getQuestionPageUseCase(
        cursor: state.nextCursor,
      );

      state = state.copyWith(
        nextCursor: page.nextCursor,
        hasNext: page.hasNext,
      );
    } finally {
      state = state.copyWith(isLoadingMore: false);
      notifyListeners();
    }
  }
  // MARK: - 필터 변경
  void changeFilter(HistoryFilter filter) {
    state = state.copyWith(filter: filter);

    _updateViewState();
  }

  // MARK: - 북마크 토글
  Future<void> toggleBookmark(int questionId) async {
    await toggleBookmarkUseCase(questionId);
  }

  // MARK: - 질문 삭제
  Future<void> deleteQuestion(int questionId) async {
    await deleteQuestionUseCase(questionId);
  }

  // MARK: - ViewState 업데이트
  void _updateViewState() {
    final filteredQuestions = _filterQuestions(_allQuestions, state.filter);

    final questionsGroupedByYear = _groupQuestionsByYear(filteredQuestions);

    state = state.copyWith(
      groupedByYear: questionsGroupedByYear,
      isInitialLoading: false,
    );

    notifyListeners();
  }

  // MARK: - 질문 필터링
  List<QuestionRecord> _filterQuestions(
    List<QuestionRecord> questions,
    HistoryFilter filter,
  ) {
    switch (filter) {
      case HistoryFilter.bookmarked:
        return questions.where((q) => q.isBookmarked).toList();

      case HistoryFilter.all:
      default:
        return questions;
    }
  }

  // MARK: - 연도별 그룹핑
  Map<int, List<QuestionRecord>> _groupQuestionsByYear(
    List<QuestionRecord> questions,
  ) {
    final Map<int, List<QuestionRecord>> result = {};

    for (final question in questions) {
      final int year = question.createdAt.year;

      result.putIfAbsent(year, () => []).add(question);
    }

    return Map.fromEntries(
      result.entries.toList()..sort((a, b) => b.key.compareTo(a.key)),
    );
  }

  @override
  void dispose() {
    _questionsSubscription?.cancel();
    super.dispose();
  }
}
