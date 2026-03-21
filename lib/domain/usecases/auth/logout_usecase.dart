import 'package:flutter/foundation.dart';

import '../../repositories/auth_repository.dart';
import '../../repositories/token_repository.dart';
import '../../repositories/user_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;
  final TokenRepository tokenRepository;
  final UserRepository userRepository;

  LogoutUseCase(
      this.authRepository,
      this.tokenRepository,
      this.userRepository,
      );

  Future<void> call() async {

    final refreshToken = await tokenRepository.getRefreshToken();
    debugPrint("==== logout refreshToken ====");
    debugPrint(refreshToken);

    if (refreshToken != null) {
      try {
        await authRepository.logout(refreshToken);
      } catch (e) {
        debugPrint("$e");
      }
    }

    await tokenRepository.clear();
    await userRepository.clearLocalUser();
  }
}
