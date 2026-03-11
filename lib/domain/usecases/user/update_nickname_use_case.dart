import '../../repositories/user_repository.dart';

class UpdateNicknameUseCase {
  final UserRepository repository;

  UpdateNicknameUseCase(this.repository);

  Future<void> call(String nickname) {
    return repository.updateNickname(nickname);
  }
}