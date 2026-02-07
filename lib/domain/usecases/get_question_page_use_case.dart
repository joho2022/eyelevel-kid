import '../entities/question_page.dart';
import '../repositories/question_repository.dart';

class GetQuestionPageUseCase {
  final QuestionRepository repository;

  GetQuestionPageUseCase(this.repository);

  Future<QuestionPage> call({
    String? cursor,
    int limit = 20,
  }) {
    return repository.getPage(
      cursor: cursor,
      limit: limit,
    );
  }
}