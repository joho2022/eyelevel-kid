import '../../repositories/user_repository.dart';

class SaveProfileUseCase {
  final UserRepository repository;

  SaveProfileUseCase(this.repository);

  Future<void> call({
    String? nickname,
    String? profileImagePath,
  }) async {
    await repository.updateProfile(
      nickname: nickname,
      profileImagePath: profileImagePath,
    );
  }
}