import '../../../domain/entities/calendar_day_summary.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('오늘의 질문') String title,
    @Default('아이의 생각을 기록해보세요') String subtitle,

    @Default(false) bool isInitialLoading,
    @Default(false) bool isCalendarLoading,
    @Default(false) bool isQuestionLoading,

    required DateTime currentMonth,
    @Default(<DateTime>{}) Set<DateTime> questionDates,

    CalendarDaySummary? selectedDay,
  }) = _HomeState;
}