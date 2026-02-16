import '../../domain/repositories/user_repository.dart';
import '../sources/local/user_local_data_source.dart';
import '../sources/mock/mock_user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final MockUserRemoteDataSource remote;
  final UserLocalDataSource local;

  UserRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<void> saveNickname(String nickname) async {
    await remote.saveNickname(nickname);

    final user = local.getUser();
    local.saveUser(user.copyWith(nickname: nickname));
  }
}
