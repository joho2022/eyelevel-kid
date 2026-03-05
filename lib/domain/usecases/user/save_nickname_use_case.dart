import '../../repositories/user_repository.dart';

class SaveNicknameUseCase {
  final UserRepository repository;

  SaveNicknameUseCase(this.repository);

  Future<void> call(String nickname) {
    return repository.updateNickname(nickname);
  }
}