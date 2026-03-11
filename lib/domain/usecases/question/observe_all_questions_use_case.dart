import '../../entities/question_record.dart';
import '../../repositories/question_repository.dart';

class ObserveAllQuestionsUseCase {
  final QuestionRepository repository;

  ObserveAllQuestionsUseCase(this.repository);

  Stream<List<QuestionRecord>> call() {
    return repository.observeQuestions();
  }
}
