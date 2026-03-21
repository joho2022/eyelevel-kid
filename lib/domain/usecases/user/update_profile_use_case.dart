import '../../repositories/user_repository.dart';

class UpdateProfileUseCase {
  final UserRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call({
    String? nickname,
    String? profileImageKey,
  }) async {
    await repository.updateProfile(
      nickname: nickname,
      profileImageKey: profileImageKey,
    );
  }
}