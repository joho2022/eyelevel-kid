import '../entities/calendar_day_summary.dart';
import '../entities/calendar_summary.dart';

abstract class CalendarRepository {
  Future<CalendarSummary> getCalendarSummary(int year, int month);

  Future<CalendarDaySummary> getQuestionsByDate(int year, int month, int day);
}
