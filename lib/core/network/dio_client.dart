import 'package:dio/dio.dart';
import '../config/app_config.dart';

class DioClient {
  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }
}
