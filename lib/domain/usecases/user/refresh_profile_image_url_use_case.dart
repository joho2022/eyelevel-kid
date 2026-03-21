import '../../repositories/user_repository.dart';

class RefreshProfileImageUrlUseCase {
  final UserRepository repository;

  RefreshProfileImageUrlUseCase(this.repository);

  Future<String?> call() async {
    return repository.refreshProfileImageUrl();
  }
}