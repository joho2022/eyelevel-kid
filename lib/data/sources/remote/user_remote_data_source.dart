import 'package:dio/dio.dart';

import '../../dto/user/upload_url_response_dto.dart';
import '../../dto/user/user_response_dto.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<UserResponseDto> fetchMe() async {
    final response = await dio.get('/user/me');
    return UserResponseDto.fromJson(response.data);
  }

  Future<UserResponseDto> updateUser({
    String? nickname,
    String? profileImageKey,
  }) async {
    final response = await dio.patch(
      '/user',
      data: {
        if (nickname != null) 'nickname': nickname,
        if (profileImageKey != null) 'profileImageKey': profileImageKey,
      },
    );

    return UserResponseDto.fromJson(response.data);
  }

  Future<UploadUrlResponseDto> createProfileImageUploadUrl() async {
    final response = await dio.post('/user/profile-image/upload-url');
    return UploadUrlResponseDto.fromJson(response.data);
  }

  Future<String?> refreshProfileImageUrl() async {
    final response = await dio.get('/user/profile-image/url');
    return response.data['profileImageUrl'] as String?;
  }
}
