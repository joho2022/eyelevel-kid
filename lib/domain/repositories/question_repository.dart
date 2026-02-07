import '../entities/question_record.dart';

abstract class QuestionRepository {
  Future<List<QuestionRecord>> fetchRecentQuestions();
}