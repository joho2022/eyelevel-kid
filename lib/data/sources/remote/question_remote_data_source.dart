import 'package:dio/dio.dart';

import '../../../domain/values/answer_style.dart';
import '../../dto/calendar/response/calendar_day_response_dto.dart';
import '../../dto/calendar/response/calendar_summary_response_dto.dart';
import '../../dto/question/request/ask_question_request_dto.dart';
import '../../dto/question/response/question_page_response_dto.dart';
import '../../dto/question/response/question_response_dto.dart';

class QuestionRemoteDataSource {

  final Dio dio;

  QuestionRemoteDataSource(this.dio);

  // MARK: - 달력 질문 날짜 조회
  Future<CalendarSummaryResponseDto> getCalendarSummary({
    required int year,
    required int month,
  }) async {

    final response = await dio.get(
      '/questions/calendar-summary',
      queryParameters: {
        'year': year,
        'month': month,
      },
    );

    return CalendarSummaryResponseDto.fromJson(response.data);
  }

  // MARK: - 특정 날짜 질문 조회
  Future<CalendarDayResponseDto> getQuestionsByDate({
    required int year,
    required int month,
    required int day,
  }) async {

    final response = await dio.get(
      '/questions/by-date',
      queryParameters: {
        'year': year,
        'month': month,
        'day': day,
      },
    );

    return CalendarDayResponseDto.fromJson(response.data);
  }

  // MARK: - 질문 생성
  Future<QuestionResponseDto> askQuestion({
    required String question,
    required AnswerStyle style,
  }) async {
    final body = AskQuestionRequestDto(
      question: question,
      style: style,
    ).toJson();

    print("==== request body ====");
    print(body);

    final response = await dio.post(
      '/questions',
      data: AskQuestionRequestDto(
        question: question,
        style: style,
      ).toJson(),
    );

    return QuestionResponseDto.fromJson(response.data);
  }

  // MARK: - 질문 목록 조회
  Future<QuestionPageResponseDto> fetchPage({
    String? cursor,
    int limit = 20,
  }) async {
    final response = await dio.get(
      '/questions',
      queryParameters: {
        'cursor': cursor,
        'limit': limit,
      },
    );

    return QuestionPageResponseDto.fromJson(response.data);
  }

  // MARK: - 북마크 토글
  Future<QuestionResponseDto> toggleBookmark(int questionId) async {
    final response = await dio.patch(
      '/questions/$questionId/bookmark',
    );

    return QuestionResponseDto.fromJson(response.data);
  }

  // MARK: - 질문 삭제
  Future<void> deleteQuestion(int questionId) async {
    await dio.delete('/questions/$questionId');
  }

  // MARK: - 단일 질문 조회
  Future<QuestionResponseDto> getQuestion(int questionId) async {

    final response = await dio.get(
      '/questions/$questionId',
    );

    return QuestionResponseDto.fromJson(response.data);
  }
}