import '../../repositories/user_repository.dart';

class FetchUserUseCase {
  final UserRepository repository;

  FetchUserUseCase(this.repository);

  Future<void> call() {
    return repository.fetchUser();
  }
}