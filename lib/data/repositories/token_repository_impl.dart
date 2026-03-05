import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../domain/repositories/token_repository.dart';
import '../sources/local/token_local_datasource.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenLocalDataSource local;

  final _controller = StreamController<String?>.broadcast();

  TokenRepositoryImpl(this.local);

  @override
  Stream<String?> get accessTokenStream => _controller.stream;

  @override
  Future<void> saveTokens(String access, String refresh) async {
    await local.save(access, refresh);
    _controller.add(access);
  }

  @override
  Future<String?> getAccessToken() {
    return local.getAccess();
  }

  @override
  Future<String?> getRefreshToken() {
    return local.getRefresh();
  }

  @override
  Future<void> clear() async {
    await local.clear();
    _controller.add(null);
  }

  @override
  Future<void> hydrate() async {
    final access = await local.getAccess();

    debugPrint("==== hydrate ====");
    debugPrint("access: $access");

    _controller.add(access);
  }
}
