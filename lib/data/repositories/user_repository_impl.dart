import 'dart:io';

import 'package:eyelevel_kid/data/sources/external/image_upload_service.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/values/answer_style.dart';
import '../sources/local/user_local_data_source.dart';
import '../sources/remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;
  final UserLocalDataSource local;
  final ImageUploadService imageUpload;

  UserRepositoryImpl({
    required this.remote,
    required this.local,
    required this.imageUpload,
  });

  @override
  Future<void> updateNickname(String nickname) async {
    final dto = await remote.updateUser(nickname: nickname);

    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImageUrl: dto.profileImageUrl,
    );

    local.saveUser(updatedUser);
  }

  @override
  Future<void> updateProfile({
    String? nickname,
    String? profileImageKey,
  }) async {
    final dto = await remote.updateUser(
      nickname: nickname,
      profileImageKey: profileImageKey,
    );

    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImageUrl: dto.profileImageUrl,
    );

    local.saveUser(updatedUser);
  }

  @override
  Future<void> fetchUser() async {
    final dto = await remote.fetchMe();

    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImageUrl: dto.profileImageUrl,
    );

    local.saveUser(updatedUser);
  }

  @override
  Future<void> updateAnswerStyle(AnswerStyle style) async {
    local.updateAnswerStyle(style);
  }

  @override
  Future<void> clearLocalUser() async {
    local.clearUser();
  }

  @override
  User getUser() => local.getUser();

  @override
  Stream<User> observeUser() => local.observeUser();

  // MARK: - 프로필 이미지 업로드
  @override
  Future<void> uploadProfileImage(File file) async {
    // 1. 서버에서 uploadUrl + key 발급
    final uploadInfo = await remote.createProfileImageUploadUrl();

    // 2. S3에 직접 업로드
    await imageUpload.uploadImage(uploadUrl: uploadInfo.uploadUrl, file: file);

    // 3. 서버에 key 저장
    final dto = await remote.updateUser(profileImageKey: uploadInfo.key);

    // 4. 서버 응답의 최신 profileImageUrl로 로컬 유저 갱신
    final updatedUser = local.getUser().copyWith(
      id: dto.id,
      nickname: dto.nickname,
      profileImageUrl: dto.profileImageUrl,
    );

    local.saveUser(updatedUser);
  }

  // MARK: - 만료 시 profileImageUrl만 재발급
  @override
  Future<String?> refreshProfileImageUrl() async {
    final profileImageUrl = await remote.refreshProfileImageUrl();

    local.updateProfileImageUrl(profileImageUrl);

    return profileImageUrl;
  }
}
