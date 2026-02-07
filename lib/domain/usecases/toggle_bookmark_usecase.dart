import '../repositories/question_repository.dart';

class ToggleBookmarkUseCase {
  final QuestionRepository repository;

  ToggleBookmarkUseCase(this.repository);

  Future<void> call(int questionId) {
    return repository.toggleBookmark(questionId);
  }
}