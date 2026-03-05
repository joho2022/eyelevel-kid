import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../domain/entities/calendar_day_summary.dart';
import '../../../domain/entities/question_record.dart';

import 'package:eyelevel_kid/ui/home/state/home_state.dart';

import '../../../domain/usecases/get_calendar_summary_use_case.dart';
import '../../../domain/usecases/get_question_page_use_case.dart';
import '../../../domain/usecases/get_questions_by_date_use_case.dart';
import '../../../domain/usecases/observe_recent_questions_use_case.dart';
import '../../../domain/usecases/toggle_bookmark_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetQuestionPageUseCase getQuestionPage;
  final GetCalendarSummaryUseCase getCalendarSummary;
  final GetQuestionsByDateUseCase getQuestionsByDate;
  final ObserveRecentQuestionsUseCase observeRecentQuestions;
  final ToggleBookmarkUseCase toggleBookmarkUseCase;

  HomeState state = HomeState(
    currentMonth: DateTime(DateTime.now().year, DateTime.now().month),
  );

  StreamSubscription<List<QuestionRecord>>? _recentSub;

  HomeViewModel({
    required this.getQuestionPage,
    required this.getCalendarSummary,
    required this.getQuestionsByDate,
    required this.observeRecentQuestions,
    required this.toggleBookmarkUseCase,
  }) {
    _init();
  }

  void _init() {
    getQuestionPage(limit: 20);
    _observeRecent();
    _loadInitial();
  }

  void _observeRecent() {
    _recentSub = observeRecentQuestions(limit: 3).listen((items) {
      state = state.copyWith(recentQuestions: items);
      notifyListeners();
    });
  }

  Future<void> _loadInitial() async {
    state = state.copyWith(isInitialLoading: true);
    notifyListeners();

    await loadCalendarSummary(state.currentMonth, force: true);

    state = state.copyWith(isInitialLoading: false);
    notifyListeners();
  }

  Future<void> loadCalendarSummary(DateTime month, {bool force = false}) async {
    if (!force &&
        month.year == state.currentMonth.year &&
        month.month == state.currentMonth.month) {
      return;
    }

    state = state.copyWith(
      isCalendarLoading: true,
      currentMonth: month,
      selectedDay: null,
    );
    notifyListeners();

    try {
      final summary = await getCalendarSummary(
        year: month.year,
        month: month.month,
      );

      state = state.copyWith(questionDates: summary.questionDates);
    } catch (e) {
      state = state.copyWith(questionDates: const {});
    } finally {
      state = state.copyWith(isCalendarLoading: false);
      notifyListeners();
    }
  }

  void selectDate(DateTime date) {
    if (state.isCalendarLoading) return;

    final hasQuestion = state.questionDates.any(
      (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );

    if (!hasQuestion) {
      state = state.copyWith(selectedDay: null);
      notifyListeners();
      return;
    }

    state = state.copyWith(isQuestionLoading: true);
    notifyListeners();

    _loadDaySummary(date);
  }

  Future<void> _loadDaySummary(DateTime date) async {
    try {
      final questions = await getQuestionsByDate(
        year: date.year,
        month: date.month,
        day: date.day,
      );

      state = state.copyWith(
        selectedDay: CalendarDaySummary(date: date, questions: questions),
      );
    } finally {
      state = state.copyWith(isQuestionLoading: false);
      notifyListeners();
    }
  }

  Future<void> toggleBookmark(QuestionRecord question) async {
    debugPrint('북마크 토글 id=${question.id}');
    await toggleBookmarkUseCase(question.id);
  }

  void onCalendarQuestionSelected(CalendarQuestionPreview question) {
    debugPrint('캘린더 질문 선택됨 id=${question.id}');
  }

  @override
  void dispose() {
    _recentSub?.cancel();
    super.dispose();
  }
}
