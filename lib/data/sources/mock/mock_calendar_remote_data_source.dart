import '../../../domain/entities/calendar_day_summary.dart';
import '../../dto/calendar_summary_dto.dart';

class MockCalendarRemoteDataSource {
  Future<CalendarSummaryDto> fetchCalendarSummary({
    required int year,
    required int month,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return CalendarSummaryDto(
      year: year,
      month: month,
      dateStrings: [
        '$year-${_two(month)}-02',
        '$year-${_two(month)}-05',
        '$year-${_two(month)}-18',
        '$year-${_two(month)}-25',
      ],
    );
  }

  Future<List<CalendarQuestionPreview>> fetchQuestionsByDate({
    required int year,
    required int month,
    required int day,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final baseDate = DateTime(year, month, day);

    return List.generate(10, (index) {
      return CalendarQuestionPreview(
        id: index + 1,
        title: _mockTitles[index % _mockTitles.length],
        createdAt: baseDate.add(Duration(minutes: index * 7)),
      );
    });
  }

  String _two(int v) => v.toString().padLeft(2, '0');

  static const _mockTitles = [
    '오늘 가장 즐거웠던 순간은?',
    '친구와 어떤 이야기를 했나요?',
    '오늘 배운 것은 무엇인가요?',
    '기억에 남는 장면은?',
    '오늘 기분을 색으로 표현한다면?',
  ];
}