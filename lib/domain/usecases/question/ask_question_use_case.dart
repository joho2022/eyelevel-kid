import '../../entities/question_record.dart';
import '../../repositories/question_repository.dart';
import '../../values/answer_style.dart';

class AskQuestionUseCase {
  final QuestionRepository repository;

  AskQuestionUseCase(this.repository);

  Future<QuestionRecord> call({
    required String question,
    required AnswerStyle style,
  }) {
    return repository.askQuestion(
      question: question,
      style: style,
    );
  }
}