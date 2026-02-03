import 'package:flutter/material.dart';

import 'package:eyelevel_kid/domain/repositories/calendar_repository.dart';
import 'package:eyelevel_kid/ui/home/state/home_state.dart';

import '../../../domain/entities/calendar_day_summary.dart';

class HomeViewModel extends ChangeNotifier {
  final CalendarRepository calendarRepository;

  HomeState state = HomeState(
    currentMonth: DateTime(DateTime.now().year, DateTime.now().month),
  );

  HomeViewModel(this.calendarRepository) {
    _loadInitialMonth();
  }

  Future<void> _loadInitialMonth() async {
    await loadCalendarSummary(state.currentMonth);
  }

  Future<void> loadCalendarSummary(DateTime month) async {
    if (month.year == state.currentMonth.year && month.month == state.currentMonth.month) {
      return;
    }

    state = state.copyWith(
      isCalendarLoading: true,
      currentMonth: month,
      selectedDay: null,
    );
    notifyListeners();

    try {
      final summary = await calendarRepository.fetchCalendarSummary(
        year: month.year,
        month: month.month,
      );

      state = state.copyWith(
        questionDates: summary.questionDates,
        selectedDay: null,
      );
    } catch (e) {
      debugPrint('Calendar summary load failed: $e');

      state = state.copyWith(
        questionDates: const {},
        selectedDay: null,
      );

    } finally {
      state = state.copyWith(isCalendarLoading: false);
      notifyListeners();
    }
  }

  void selectDate(DateTime date) {
    if (state.isCalendarLoading) return;

    final hasQuestion = state.questionDates.any(
          (d) => d.year == date.year &&
          d.month == date.month &&
          d.day == date.day,
    );

    if (!hasQuestion) {
      state = state.copyWith(
        selectedDay: null,
        isQuestionLoading: false,
      );
      notifyListeners();
      return;
    }

    state = state.copyWith(
      isQuestionLoading: true,
    );
    notifyListeners();

    _loadDaySummary(date);
  }

  Future<void> _loadDaySummary(DateTime date) async {
    try {
      final questions = await calendarRepository.fetchQuestionsByDate(
        year: date.year,
        month: date.month,
        day: date.day,
      );

      state = state.copyWith(
        selectedDay: CalendarDaySummary(
          date: date,
          questions: questions,
        ),
      );
    } catch (e) {
      debugPrint('Failed to load day questions: $e');
      state = state.copyWith(selectedDay: null);
    } finally {
      state = state.copyWith(isQuestionLoading: false);
      notifyListeners();
    }
  }

  void onQuestionSelected(QuestionPreview question) {
    debugPrint('질문 셀 클릭됨 id=${question.id}');
    // TODO: 상세 화면 이동 / API 호출
  }
}