import '../../entities/calendar_summary.dart';
import '../../repositories/calendar_repository.dart';

class GetCalendarSummaryUseCase {
  final CalendarRepository repository;

  GetCalendarSummaryUseCase(this.repository);

  Future<CalendarSummary> call(int year, int month) {
    return repository.getCalendarSummary(year, month);
  }
}
