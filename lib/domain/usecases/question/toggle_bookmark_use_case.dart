import '../../entities/question_record.dart';
import '../../repositories/question_repository.dart';

class ToggleBookmarkUseCase {
  final QuestionRepository repository;

  ToggleBookmarkUseCase(this.repository);

  Future<QuestionRecord> call(int questionId) {
    return repository.toggleBookmark(questionId);
  }
}