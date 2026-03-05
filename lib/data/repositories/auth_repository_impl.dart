import '../../domain/repositories/auth_repository.dart';
import '../sources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Map<String, dynamic>> socialLogin(
      String provider,
      String idToken,
      ) {
    return remote.socialLogin(
        provider, idToken);
  }

  @override
  Future<Map<String, dynamic>> refresh(
      String refreshToken,
      ) {
    return remote.refresh(refreshToken);
  }
}