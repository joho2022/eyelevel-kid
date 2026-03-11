import '../entities/question_page.dart';
import '../entities/question_record.dart';
import '../values/answer_style.dart';

abstract class QuestionRepository {

  // MARK: - 질문 생성
  Future<QuestionRecord> askQuestion({
    required String question,
    required AnswerStyle style,
  });

  // MARK: - 질문 페이지 조회
  Future<QuestionPage> fetchQuestionPage({
    String? cursor,
    int limit = 20,
  });

  // MARK: - 질문 목록 관찰
  Stream<List<QuestionRecord>> observeQuestions();

  // MARK: - 단일 질문 조회
  Future<QuestionRecord?> getById(int id);

  // MARK: - 북마크 토글
  Future<QuestionRecord> toggleBookmark(int questionId);

  // MARK: - 질문 삭제
  Future<void> deleteQuestion(int questionId);
}