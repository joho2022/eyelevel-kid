import '../repositories/user_repository.dart';

class SaveProfileUseCase {
  final UserRepository repository;

  SaveProfileUseCase(this.repository);

  Future<void> call({
    required String nickname,
    required String? imagePath,
  }) async {
    final currentUser = repository.getUser();

    final updatedUser = currentUser.copyWith(
      nickname: nickname,
      profileImagePath: imagePath,
    );

    await repository.saveUser(updatedUser);
  }
}