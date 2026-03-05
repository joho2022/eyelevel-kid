import 'package:dio/dio.dart';

import '../../dto/user/user_response_dto.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<UserResponseDto> updateUser({
    String? nickname,
    String? profileImagePath,
  }) async {
    final response = await dio.patch(
      '/user',
      data: {
        if (nickname != null) 'nickname': nickname,
        if (profileImagePath != null) 'profileImagePath': profileImagePath,
      },
    );

    return UserResponseDto.fromJson(response.data);
  }

  Future<UserResponseDto> fetchMe() async {
    final response = await dio.get('/user/me');
    return UserResponseDto.fromJson(response.data);
  }
}