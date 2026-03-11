import '../../entities/user.dart';
import '../../repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  User call() {
    return repository.getUser();
  }
}