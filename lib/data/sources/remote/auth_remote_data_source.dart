import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<Map<String, dynamic>> socialLogin(
    String provider,
    String idToken,
  ) async {
    final response = await dio.post(
      "/auth/social-login",
      data: {"provider": provider, "idToken": idToken},
    );

    return response.data;
  }

  Future<Map<String, dynamic>> refresh(String refreshToken) async {
    final response = await dio.post(
      "/auth/refresh",
      data: {"refreshToken": refreshToken},
    );

    return response.data;
  }
}
