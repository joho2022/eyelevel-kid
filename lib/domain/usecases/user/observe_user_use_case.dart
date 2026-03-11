import '../../entities/user.dart';
import '../../repositories/user_repository.dart';

class ObserveUserUseCase {
  final UserRepository repository;

  ObserveUserUseCase(this.repository);

  Stream<User> call() {
    return repository.observeUser();
  }
}