import 'package:flutter/material.dart';

import '../../../domain/entities/calendar_day_summary.dart';
import '../../../domain/entities/question_record.dart';

import 'package:eyelevel_kid/ui/home/state/home_state.dart';

import '../../../domain/usecases/get_calendar_summary_use_case.dart';
import '../../../domain/usecases/get_questions_by_date_use_case.dart';
import '../../../domain/usecases/get_recent_questions_use_case.dart';

class HomeViewModel extends ChangeNotifier {
  final GetCalendarSummaryUseCase getCalendarSummary;
  final GetQuestionsByDateUseCase getQuestionsByDate;
  final GetRecentQuestionsUseCase getRecentQuestions;

  HomeState state = HomeState(
    currentMonth: DateTime(DateTime.now().year, DateTime.now().month),
  );

  HomeViewModel(this.getCalendarSummary, this.getQuestionsByDate, this.getRecentQuestions) {
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    state = state.copyWith(isInitialLoading: true);
    notifyListeners();

    await Future.wait([
      loadCalendarSummary(state.currentMonth, force: true),
      loadRecentQuestions(),
    ]);

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

      state = state.copyWith(
        questionDates: summary.questionDates,
        selectedDay: null,
      );
    } catch (e) {
      debugPrint('Calendar summary load failed: $e');

      state = state.copyWith(questionDates: const {}, selectedDay: null);
    } finally {
      state = state.copyWith(isCalendarLoading: false);
      notifyListeners();
    }
  }

  Future<void> loadRecentQuestions() async {
    try {
      final questions = await getRecentQuestions();
      state = state.copyWith(recentQuestions: questions);
    } catch (e) {
      debugPrint('Failed to load recent questions: $e');
      state = state.copyWith(recentQuestions: []);
    }
  }

  void selectDate(DateTime date) {
    if (state.isCalendarLoading) return;

    final hasQuestion = state.questionDates.any(
      (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );

    if (!hasQuestion) {
      state = state.copyWith(selectedDay: null, isQuestionLoading: false);
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
    } catch (e) {
      debugPrint('Failed to load day questions: $e');
      state = state.copyWith(selectedDay: null);
    } finally {
      state = state.copyWith(isQuestionLoading: false);
      notifyListeners();
    }
  }

  void onCalendarQuestionSelected(CalendarQuestionPreview question) {
    debugPrint('캘린더 질문 선택됨 id=${question.id}');
  }

  void onRecentQuestionSelected(QuestionRecord question) {
    debugPrint('최근 질문 카드 선택됨 title=${question.title}');
  }

  void toggleBookmark(QuestionRecord question) {
    debugPrint("북마크 토글");
  }
}
