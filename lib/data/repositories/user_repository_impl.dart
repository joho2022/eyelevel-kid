import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/values/answer_style.dart';
import '../sources/local/user_local_data_source.dart';
import '../sources/remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;
  final UserLocalDataSource local;

  UserRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<void> updateNickname(String nickname) async {
    final dto = await remote.updateUser(nickname: nickname);

    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImagePath: dto.profileImagePath,
    );

    local.saveUser(updatedUser);
  }

  @override
  Future<void> updateProfile({
    String? nickname,
    String? profileImagePath,
  }) async {
    final dto = await remote.updateUser(
      nickname: nickname,
      profileImagePath: profileImagePath,
    );

    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImagePath: dto.profileImagePath,
    );

    local.saveUser(updatedUser);
  }

  @override
  Future<void> fetchUser() async {
    final dto = await remote.fetchMe();

    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImagePath: dto.profileImagePath,
    );

    local.saveUser(updatedUser);
  }

  @override
  Future<void> updateAnswerStyle(AnswerStyle style) async {
    local.updateAnswerStyle(style);
  }

  @override
  User getUser() => local.getUser();

  @override
  Stream<User> observeUser() => local.observeUser();
}
