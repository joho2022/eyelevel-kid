import '../../domain/entities/calendar_day_summary.dart';
import '../../domain/entities/calendar_summary.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../dto/calendar_summary_dto.dart';
import '../sources/mock/mock_calendar_remote_data_source.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final MockCalendarRemoteDataSource remote;

  CalendarRepositoryImpl(this.remote);

  @override
  Future<CalendarSummary> fetchCalendarSummary({
    required int year,
    required int month,
  }) async {
    final dto = await remote.fetchCalendarSummary(
      year: year,
      month: month,
    );

    return dto.toEntity();
  }

  @override
  Future<List<CalendarQuestionPreview>> fetchQuestionsByDate({
    required int year,
    required int month,
    required int day,
  }) {
    return remote.fetchQuestionsByDate(
      year: year,
      month: month,
      day: day,
    );
  }
}