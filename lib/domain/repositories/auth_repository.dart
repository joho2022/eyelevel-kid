abstract class AuthRepository {
  Future<Map<String, dynamic>> socialLogin(String provider, String idToken);

  Future<Map<String, dynamic>> refresh(String refreshToken);

  Future<void> logout(String refreshToken);

  Future<void> withdraw();
}
