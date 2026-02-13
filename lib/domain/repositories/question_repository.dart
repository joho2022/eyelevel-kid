import '../entities/question_page.dart';
import '../entities/question_record.dart';
import '../values/answer_style.dart';

abstract class QuestionRepository {
  Future<QuestionRecord> askQuestion({
    required String question,
    required AnswerStyle style,
  });


  Future<QuestionPage> getPage({
    String? cursor,
    int limit = 20,
  });

  Stream<List<QuestionRecord>> observeAll();

  List<QuestionRecord> getAllCached();

  Future<QuestionRecord?> getById(int id);
  Future<QuestionRecord> toggleBookmark(int questionId);
  Future<void> remove(int questionId);
}