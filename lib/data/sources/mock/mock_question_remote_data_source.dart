import '../../dto/question_page_dto.dart';
import '../../dto/question_record_dto.dart';

class MockQuestionRemoteDataSource {
  Future<QuestionPageDto> fetchPage({
    String? cursor,
    int limit = 20,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final start = cursor == null ? 0 : int.parse(cursor);

    final items = List.generate(limit, (i) {
      final index = start + i;
      return QuestionRecordDto(
        id: index,
        title: '오늘의 질문 $index',
        answer: '아이의 생각이 여기에 들어갑니다.',
        style: index.isEven ? 'story' : 'reason',
        createdAt: DateTime.now()
            .subtract(Duration(days: index))
            .toIso8601String(),
        isBookmarked: index % 3 == 0,
      );
    });

    return QuestionPageDto(
      items: items,
      nextCursor: (start + limit).toString(),
      hasNext: start + limit < 100,
    );
  }
}