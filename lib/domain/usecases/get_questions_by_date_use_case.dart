
import '../entities/calendar_day_summary.dart';
import '../repositories/calendar_repository.dart';

class GetQuestionsByDateUseCase {
  final CalendarRepository repository;

  GetQuestionsByDateUseCase(this.repository);

  Future<List<CalendarQuestionPreview>> call({
    required int year,
    required int month,
    required int day,
  }) {
    return repository.fetchQuestionsByDate(
      year: year,
      month: month,
      day: day,
    );
  }
}