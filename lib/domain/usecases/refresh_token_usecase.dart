import '../repositories/auth_repository.dart';
import '../repositories/token_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository authRepository;
  final TokenRepository tokenRepository;

  RefreshTokenUseCase(
      this.authRepository,
      this.tokenRepository,
      );

  Future<String> call() async {
    final refreshToken =
    await tokenRepository.getRefreshToken();

    if (refreshToken == null) {
      throw Exception("No refresh token");
    }

    final result =
    await authRepository.refresh(refreshToken);

    final newAccess = result['accessToken'];

    await tokenRepository.saveTokens(
      newAccess,
      refreshToken,
    );

    return newAccess;
  }
}