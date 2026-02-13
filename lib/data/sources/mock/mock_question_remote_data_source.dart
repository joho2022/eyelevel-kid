import '../../../domain/values/answer_style.dart';
import '../../dto/question_page_dto.dart';
import '../../dto/question_record_dto.dart';

class MockQuestionRemoteDataSource {
  Future<String> askQuestion({
    required String question,
    required AnswerStyle style,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    if (style == AnswerStyle.story) {
      return _storyStyle(question);
    } else {
      return _reasonStyle(question);
    }
  }

  String _storyStyle(String question) {
    if (question.contains('하늘')) {
      return '''
하늘은 우리 머리 위에 아주 넓게 펼쳐진 커다란 공간이에요.

낮에는 파란색으로 보이고,
밤에는 까만색이 되면서 별들이 반짝여요.

마치 큰 이불처럼 우리 세상을 덮고 있는 것 같죠 😊
''';
    }

    return '''
$question 에 대해서 이야기처럼 쉽게 설명해볼게요.

이건 우리가 주변에서 자주 볼 수 있는 것이고,
눈으로 보고 느낄 수 있는 거예요.

그래서 생각해보면 어렵지 않아요 😊
''';
  }

  String _reasonStyle(String question) {
    if (question.contains('하늘')) {
      return '''
하늘은 지구를 둘러싸고 있는 공기층(대기)을 말해요.

낮에 하늘이 파랗게 보이는 이유는
태양빛이 공기 중에서 퍼지기 때문이에요.

빛 중에서 파란빛이 더 많이 퍼져서
우리 눈에는 하늘이 파랗게 보이는 거예요.
''';
    }

    return '''
$question 에 대해 원리와 이유를 설명해볼게요.

이 현상은 특정한 구조나 과학적 원리에 의해 일어나요.

왜 그런지 이해하면,
겉으로 보이는 모습보다 더 깊이 알 수 있어요.
''';
  }

  Future<QuestionPageDto> fetchPage({String? cursor, int limit = 20}) async {
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
