import 'social_auth_data_source.dart';

class AppleAuthDataSource implements SocialAuthDataSource {
  @override
  Future<String> getIdToken() async {
    // TODO: Apple 로그인 로직 구현
    throw UnimplementedError();
  }
}