import '../entities/user.dart';

abstract class UserRepository {
  User getUser();
  Stream<User> observeUser();
  Future<void> saveUser(User user);
}