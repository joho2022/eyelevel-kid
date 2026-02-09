import '../entities/question_page.dart';
import '../entities/question_record.dart';

abstract class QuestionRepository {
  Future<QuestionPage> getPage({
    String? cursor,
    int limit = 20,
  });

  Stream<List<QuestionRecord>> observeAll();

  List<QuestionRecord> getAllCached();

  Future<void> toggleBookmark(int questionId);
  Future<void> remove(int questionId);
}