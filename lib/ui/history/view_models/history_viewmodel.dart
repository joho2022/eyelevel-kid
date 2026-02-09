import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../domain/entities/question_record.dart';
import '../../../domain/usecases/delete_question_use_case.dart';
import '../../../domain/usecases/get_all_questions_snapshot_use_case.dart';
import '../../../domain/usecases/observe_all_questions_use_case.dart';
import '../../../domain/usecases/toggle_bookmark_usecase.dart';
import '../state/history_state.dart';

class HistoryViewModel extends ChangeNotifier {
  final ObserveAllQuestionsUseCase observeAllQuestionsUseCase;
  final ToggleBookmarkUseCase toggleBookmarkUseCase;
  final DeleteQuestionUseCase deleteQuestionUseCase;
  final GetAllQuestionsSnapshotUseCase getAllQuestionsSnapshotUseCase;

  HistoryState state = const HistoryState();

  StreamSubscription<List<QuestionRecord>>? _questionsSubscription;

  List<QuestionRecord> _allQuestions = [];

  HistoryViewModel(
      this.observeAllQuestionsUseCase,
      this.toggleBookmarkUseCase,
      this.deleteQuestionUseCase,
      this.getAllQuestionsSnapshotUseCase,
      ) {
    _subscribeToQuestions();
  }

  void _subscribeToQuestions() {
    state = state.copyWith(isInitialLoading: true);
    notifyListeners();

    _allQuestions = getAllQuestionsSnapshotUseCase();
    _updateViewState();

    _questionsSubscription =
        observeAllQuestionsUseCase().listen((questions) {
          _allQuestions = questions;
          _updateViewState();
        });
  }

  void changeFilter(HistoryFilter filter) {
    state = state.copyWith(filter: filter);
    _updateViewState();
  }

  void toggleBookmark(int questionId) {
    toggleBookmarkUseCase(questionId);
  }

  void deleteQuestion(int questionId) {
    deleteQuestionUseCase(questionId);
  }

  void _updateViewState() {
    final filteredQuestions =
    _filterQuestions(_allQuestions, state.filter);

    final questionsGroupedByYear =
    _groupQuestionsByYear(filteredQuestions);

    state = state.copyWith(
      groupedByYear: questionsGroupedByYear,
      isInitialLoading: false,
    );

    notifyListeners();
  }

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

  Map<int, List<QuestionRecord>> _groupQuestionsByYear(
      List<QuestionRecord> questions,
      ) {
    final Map<int, List<QuestionRecord>> result = {};

    for (final question in questions) {
      final int year = question.createdAt.year;
      result.putIfAbsent(year, () => []).add(question);
    }

    return Map.fromEntries(
      result.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key)),
    );
  }

  @override
  void dispose() {
    _questionsSubscription?.cancel();
    debugPrint('HistoryViewModel dispose');
    super.dispose();
  }
}