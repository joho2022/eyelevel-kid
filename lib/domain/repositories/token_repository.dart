abstract class TokenRepository {
  Future<void> saveTokens(String access, String refresh);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> clear();

  Future<void> hydrate();

  Stream<String?> get accessTokenStream;
}
