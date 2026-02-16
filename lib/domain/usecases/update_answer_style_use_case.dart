import '../repositories/user_repository.dart';
import '../values/answer_style.dart';

class UpdateAnswerStyleUseCase {
  final UserRepository repository;

  UpdateAnswerStyleUseCase(this.repository);

  Future<void> call(AnswerStyle style) async {
    final current = repository.getUser();
    final updated = current.copyWith(answerStyle: style);
    await repository.saveUser(updated);
  }
}