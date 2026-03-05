import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/usecases/refresh_token_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

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
  final RefreshTokenUseCase refreshUseCase;
  final LogoutUseCase logoutUseCase;

  final _RefreshManager _refreshManager = _RefreshManager();

  RefreshInterceptor({
    required this.retryDio,
    required this.refreshUseCase,
    required this.logoutUseCase,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    try {
      final newAccess = await _refreshManager.execute(() => refreshUseCase());

      final requestOptions = err.requestOptions;

      requestOptions.headers['Authorization'] = 'Bearer $newAccess';

      final response = await retryDio.fetch(requestOptions);

      return handler.resolve(response);
    } catch (_) {
      await logoutUseCase();
      return handler.next(err);
    }
  }
}
