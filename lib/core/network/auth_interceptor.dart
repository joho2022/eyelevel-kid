import 'package:dio/dio.dart';

import '../../domain/repositories/token_repository.dart';

class AuthInterceptor extends Interceptor {
  final TokenRepository tokenRepository;

  AuthInterceptor(this.tokenRepository);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final access = await tokenRepository.getAccessToken();

    if (access != null) {
      options.headers['Authorization'] = 'Bearer $access';
    }

    handler.next(options);
  }
}