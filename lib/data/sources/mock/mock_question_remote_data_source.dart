import '../../dto/question_record_dto.dart';

class MockQuestionRemoteDataSource {
  Future<List<QuestionRecordDto>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return List.generate(10, (i) {
      return QuestionRecordDto(
        id: i,
        title: '오늘의 질문 $i',
        answer: '아이의 생각이 여기에 들어갑니다.',
        style: i.isEven ? 'story' : 'reason',
        createdAt: DateTime.now()
            .subtract(Duration(days: i))
            .toIso8601String(),
        isBookmarked: i == 0,
      );
    });
  }
}