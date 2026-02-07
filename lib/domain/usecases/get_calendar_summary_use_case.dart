import '../entities/calendar_summary.dart';
import '../repositories/calendar_repository.dart';

class GetCalendarSummaryUseCase {
  final CalendarRepository repository;

  GetCalendarSummaryUseCase(this.repository);

  Future<CalendarSummary> call({
    required int year,
    required int month,
  }) {
    return repository.fetchCalendarSummary(
      year: year,
      month: month,
    );
  }
}