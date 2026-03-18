import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/repositories/token_repository.dart';

class _RefreshManager {
  bool _isRefreshing = false;
  Completer<String>? _completer;

  Future<String> execute(Future<String> Function() refreshCall) async {
    if (_isRefreshing) {
      return _completer!.future;
    }

    _isRefreshing = true;
    _completer = Completer<String>();

    try {
      final newAccess = await refreshCall();
      _completer!.complete(newAccess);
      return newAccess;
    } catch (e) {
      _completer!.completeError(e);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }
}

class RefreshInterceptor extends Interceptor {
  final Dio retryDio;
  final TokenRepository tokenRepository;

  final _RefreshManager _refreshManager = _RefreshManager();

  RefreshInterceptor({
    required this.retryDio,
    required this.tokenRepository,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final requestOptions = err.requestOptions;
    final isRefreshRequest = requestOptions.path == '/auth/refresh';
    final isRetriedRequest = requestOptions.extra['retried'] == true;

    if (isRefreshRequest || isRetriedRequest) {
      await tokenRepository.clear();
      return handler.next(err);
    }

    try {
      final newAccess = await _refreshManager.execute(() async {
        final refreshToken = await tokenRepository.getRefreshToken();

        if (refreshToken == null) {
          throw Exception('No refresh token');
        }

        final response = await retryDio.post(
          '/auth/refresh',
          data: {'refreshToken': refreshToken},
        );

        final result = Map<String, dynamic>.from(response.data as Map);
        final access = result['accessToken'] as String;
        final nextRefresh = (result['refreshToken'] as String?) ?? refreshToken;

        await tokenRepository.saveTokens(access, nextRefresh);

        return access;
      });

      requestOptions.headers['Authorization'] = 'Bearer $newAccess';
      requestOptions.extra['retried'] = true;

      final response = await retryDio.fetch(requestOptions);

      return handler.resolve(response);
    } catch (_) {
      await tokenRepository.clear();

      return handler.next(err);
    }
  }
}
