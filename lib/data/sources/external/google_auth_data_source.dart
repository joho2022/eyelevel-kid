import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'social_auth_data_source.dart';

class GoogleAuthDataSource implements SocialAuthDataSource {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  @override
  Future<String> getIdToken() async {
    debugPrint('==== GoogleAuthDataSource 진입 ====');

    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];
    debugPrint('webClientId: $webClientId');

    if (webClientId == null || webClientId.isEmpty) {
      throw Exception('GOOGLE_WEB_CLIENT_ID가 설정되지 않았습니다.');
    }

    debugPrint('initialize 시작');
    await _googleSignIn.initialize(
      clientId: dotenv.env['GOOGLE_IOS_CLIENT_ID'],
      serverClientId: webClientId,
    );
    debugPrint('initialize 완료');

    debugPrint('authenticate 시작');
    final account = await _googleSignIn.authenticate();
    debugPrint('authenticate 완료');

    debugPrint('account: ${account.email}');

    debugPrint('authentication 가져오기');
    final authentication = account.authentication;
    debugPrint('authentication 완료');

    final idToken = authentication.idToken;
    debugPrint('idToken: ${idToken?.substring(0, 20)}...');

    if (idToken == null) {
      throw Exception('idToken이 null입니다.');
    }

    debugPrint('==== GoogleAuthDataSource 종료 ====');

    return idToken;
  }
}