import '../../repositories/auth_repository.dart';

class SocialLoginUseCase {
  final AuthRepository repository;

  SocialLoginUseCase(this.repository);

  Future<Map<String, dynamic>> call(
      String provider,
      String idToken,
      ) {
    return repository.socialLogin(provider, idToken);
  }
}