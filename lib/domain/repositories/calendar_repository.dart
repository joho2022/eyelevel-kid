import 'package:eyelevel_kid/domain/entities/calendar_summary.dart';
import '../entities/calendar_day_summary.dart';

abstract class CalendarRepository {
  Future<CalendarSummary> fetchCalendarSummary({
    required int year,
    required int month,
  });

  Future<List<QuestionPreview>> fetchQuestionsByDate({
    required int year,
    required int month,
    required int day,
  });
}