import 'package:flutter/foundation.dart';

import '../../repositories/auth_repository.dart';
import '../../repositories/token_repository.dart';

class WithdrawUseCase {
  final AuthRepository authRepository;
  final TokenRepository tokenRepository;

  WithdrawUseCase(
      this.authRepository,
      this.tokenRepository,
      );

  Future<void> call() async {
    try {
      await authRepository.withdraw();
    } catch (e) {
      debugPrint("withdraw api failed: $e");
    }

    await tokenRepository.clear();
  }
}