import 'package:dio/dio.dart';

import '../../dto/app_config/response/app_config_response_dto.dart';

class AppConfigRemoteDataSource {
  final Dio dio;

  AppConfigRemoteDataSource(this.dio);

  Future<AppConfigResponseDto> fetchAppConfig() async {
    final response = await dio.get('/app/config');
    return AppConfigResponseDto.fromJson(response.data);
  }
}