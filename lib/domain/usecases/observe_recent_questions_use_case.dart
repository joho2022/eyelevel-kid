import '../entities/question_record.dart';
import '../repositories/question_repository.dart';

class ObserveRecentQuestionsUseCase {
  final QuestionRepository repository;

  ObserveRecentQuestionsUseCase(this.repository);

  Stream<List<QuestionRecord>> call({int limit = 3}) {
    return repository
        .observeAll()
        .map((list) => list.take(limit).toList());
  }
}