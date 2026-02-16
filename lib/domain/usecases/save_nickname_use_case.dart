import '../repositories/user_repository.dart';

class SaveNicknameUseCase {
  final UserRepository repository;

  SaveNicknameUseCase(this.repository);

  Future<void> call(String nickname) {
    if (nickname == '관리자') {
      throw Exception('이미 사용 중인 닉네임이에요');
    }

    return repository.saveNickname(nickname);
  }
}