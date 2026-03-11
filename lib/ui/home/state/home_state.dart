import '../../../domain/entities/calendar_day_summary.dart';
import '../../../domain/entities/question_record.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('오늘 아이는 어떤 세상을 봤을까요?') String title,
    @Default('아이의 시선을 차곡차곡 기록해보세요') String subtitle,

    @Default(false) bool isInitialLoading,
    @Default(false) bool isCalendarLoading,
    @Default(false) bool isQuestionLoading,
    @Default(false) bool isRecentLoading,

    required DateTime currentMonth,
    @Default(<DateTime>{}) Set<DateTime> questionDates,
    CalendarDaySummary? selectedDay,

    @Default(<QuestionRecord>[]) List<QuestionRecord> recentQuestions,

    String? recentError,
    String? calendarError,
    String? dayQuestionError,
  }) = _HomeState;
}