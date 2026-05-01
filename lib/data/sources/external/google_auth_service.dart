import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'social_auth_service.dart';

class GoogleAuthService implements SocialAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  @override
  Future<String> getIdToken() async {
    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];
    final iosClientId = dotenv.env['GOOGLE_IOS_CLIENT_ID'];

    if (webClientId == null || webClientId.isEmpty) {
      throw Exception('GOOGLE_WEB_CLIENT_ID가 설정되지 않았습니다.');
    }

    if (Platform.isIOS && (iosClientId == null || iosClientId.isEmpty)) {
      throw Exception('GOOGLE_IOS_CLIENT_ID가 설정되지 않았습니다.');
    }

    await _googleSignIn.initialize(
      clientId: Platform.isIOS ? iosClientId : null,
      serverClientId: webClientId,
    );
    final account = await _googleSignIn.authenticate();
    final authentication = account.authentication;

    final idToken = authentication.idToken;

    if (idToken == null) {
      throw Exception('idToken이 null입니다.');
    }

    return idToken;
  }
}
