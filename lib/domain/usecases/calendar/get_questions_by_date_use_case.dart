import '../../entities/calendar_day_summary.dart';
import '../../repositories/calendar_repository.dart';

class GetQuestionsByDateUseCase {
  final CalendarRepository repository;

  GetQuestionsByDateUseCase(this.repository);

  Future<CalendarDaySummary> call(int year, int month, int day) {
    return repository.getQuestionsByDate(year, month, day);
  }
}
