import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../sources/local/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource local;

  UserRepositoryImpl(this.local);

  @override
  User getUser() => local.getUser();

  @override
  Stream<User> observeUser() => local.observeUser();

  @override
  Future<void> saveUser(User user) async {
    local.saveUser(user);
  }
}
