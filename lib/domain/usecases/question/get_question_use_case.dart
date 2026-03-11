import '../../entities/question_record.dart';
import '../../repositories/question_repository.dart';

class GetQuestionUseCase {
  final QuestionRepository repository;

  GetQuestionUseCase(this.repository);

  Future<QuestionRecord?> call(int id) {
    return repository.getById(id);
  }
}