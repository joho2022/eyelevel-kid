import 'package:eyelevel_kid/domain/entities/calendar_summary.dart';
import 'package:eyelevel_kid/domain/repositories/calendar_repository.dart';
import 'package:eyelevel_kid/data/dto/calendar_summary_dto.dart';

import '../../domain/entities/calendar_day_summary.dart';

class MockCalendarRepository implements CalendarRepository {
  @override
  Future<CalendarSummary> fetchCalendarSummary({
    required int year,
    required int month,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final dto = CalendarSummaryDto(
      year: year,
      month: month,
      dateStrings: [
        '$year-${_twoDigits(month)}-02',
        '$year-${_twoDigits(month)}-05',
        '$year-${_twoDigits(month)}-18',
        '$year-${_twoDigits(month)}-25',
      ],
    );

    return dto.toEntity();
  }

  @override
  Future<List<QuestionPreview>> fetchQuestionsByDate({
    required int year,
    required int month,
    required int day,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final baseDate = DateTime(year, month, day);

    return List.generate(10, (index) {
      return QuestionPreview(
        id: index + 1,
        title: _mockTitles[index % _mockTitles.length],
        createdAt: baseDate.add(
          Duration(minutes: index * 7),
        ),
      );
    });
  }

  String _twoDigits(int value) =>
      value.toString().padLeft(2, '0');

  static const List<String> _mockTitles = [
    '오늘 가장 즐거웠던 순간은 언제였나요오늘 가장 즐거웠던 순간은 언제였나요?',
    '친구와 어떤 이야기를 나눴나요?',
    '오늘 새롭게 배운 것은 무엇인가요?',
    '기억에 남는 장면을 말해볼까요?',
    '오늘 기분을 색으로 표현한다면?',
    '가장 웃음이 났던 일은?',
    '오늘 도와준 사람은 있었나요?',
    '내일 기대되는 일은 무엇인가요?',
    '오늘 가장 열심히 한 일은?',
    '지금 떠오르는 생각을 말해볼까요?',
  ];
}