
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'social_auth_service.dart';

class AppleAuthService implements SocialAuthService {

  @override
  Future<String> getIdToken() async {
    debugPrint('==== AppleAuthService 진입 ====');

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    debugPrint('credential 가져오기 완료');

    final idToken = credential.identityToken;

    debugPrint('idToken: ${idToken?.substring(0, 20)}...');

    if (idToken == null) {
      throw Exception('Apple idToken이 null입니다.');
    }

    debugPrint('==== AppleAuthService 종료 ====');

    return idToken;
  }
}