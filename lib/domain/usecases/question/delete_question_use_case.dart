import 'package:eyelevel_kid/domain/repositories/question_repository.dart';

class DeleteQuestionUseCase {
  final QuestionRepository repository;

  DeleteQuestionUseCase(this.repository);

  Future<void> call(int questionId) {
    return repository.deleteQuestion(questionId);
  }
}
