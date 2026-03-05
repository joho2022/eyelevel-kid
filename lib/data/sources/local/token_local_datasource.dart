import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenLocalDataSource {
  final _storage = const FlutterSecureStorage();

  static const _accessKey = "ACCESS_TOKEN";
  static const _refreshKey = "REFRESH_TOKEN";

  Future<void> save(String access, String refresh) async {
    await _storage.write(key: _accessKey, value: access);
    await _storage.write(key: _refreshKey, value: refresh);
  }

  Future<String?> getAccess() => _storage.read(key: _accessKey);

  Future<String?> getRefresh() => _storage.read(key: _refreshKey);

  Future<void> clear() => _storage.deleteAll();
}
