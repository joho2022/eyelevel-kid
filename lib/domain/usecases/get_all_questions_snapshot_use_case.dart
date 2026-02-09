import '../entities/question_record.dart';
import '../repositories/question_repository.dart';

class GetAllQuestionsSnapshotUseCase {
  final QuestionRepository repository;

  GetAllQuestionsSnapshotUseCase(this.repository);

  List<QuestionRecord> call() {
    return repository.getAllCached();
  }
}