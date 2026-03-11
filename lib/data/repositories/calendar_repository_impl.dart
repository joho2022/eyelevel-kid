import '../../domain/entities/calendar_day_summary.dart';
import '../../domain/entities/calendar_summary.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../dto/calendar/response/calendar_day_response_dto.dart';
import '../dto/calendar/response/calendar_summary_response_dto.dart';
import '../sources/remote/question_remote_data_source.dart';

class CalendarRepositoryImpl implements CalendarRepository {

  final QuestionRemoteDataSource remote;

  CalendarRepositoryImpl(this.remote);

  @override
  Future<CalendarSummary> getCalendarSummary(
      int year,
      int month,
      ) async {

    final dto = await remote.getCalendarSummary(
      year: year,
      month: month,
    );

    return dto.toDomain();
  }

  @override
  Future<CalendarDaySummary> getQuestionsByDate(
      int year,
      int month,
      int day,
      ) async {

    final dto = await remote.getQuestionsByDate(
      year: year,
      month: month,
      day: day,
    );

    return dto.toDomain();
  }
}