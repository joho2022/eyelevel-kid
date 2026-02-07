import '../entities/question_record.dart';
import '../repositories/question_repository.dart';

class GetRecentQuestionsUseCase {
  final QuestionRepository repository;

  GetRecentQuestionsUseCase(this.repository);

  Future<List<QuestionRecord>> call() {
    return repository.fetchRecentQuestions();
  }
}