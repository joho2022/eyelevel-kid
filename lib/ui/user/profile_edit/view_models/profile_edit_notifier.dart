import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/image/image_compress_service.dart';
import '../../../../core/image/image_picker_service.dart';
import '../../../../domain/usecases/user/get_user_use_case.dart';
import '../../../../domain/usecases/user/update_profile_use_case.dart';
import '../../../../domain/usecases/user/upload_profile_image_use_case.dart';
import '../state/profile_edit_state.dart';

final profileEditNotifierProvider =
    NotifierProvider.autoDispose<ProfileEditNotifier, ProfileEditState>(
      ProfileEditNotifier.new,
    );

class ProfileEditNotifier extends Notifier<ProfileEditState> {
  late final UpdateProfileUseCase _updateProfileUseCase;
  late final GetUserUseCase _getUserUseCase;
  late final UploadProfileImageUseCase _uploadProfileImageUseCase;
  late final ImagePickerService _imagePickerService;
  late final ImageCompressService _imageCompressService;

  late String _originalNickname;

  // MARK: - Build
  @override
  ProfileEditState build() {
    _updateProfileUseCase = serviceLocator<UpdateProfileUseCase>();
    _getUserUseCase = serviceLocator<GetUserUseCase>();
    _uploadProfileImageUseCase = serviceLocator<UploadProfileImageUseCase>();
    _imagePickerService = serviceLocator<ImagePickerService>();
    _imageCompressService = serviceLocator<ImageCompressService>();

    final user = _getUserUseCase();

    _originalNickname = user.nickname;

    return ProfileEditState(
      nickname: user.nickname,
      imagePath: user.profileImageUrl,
    );
  }

  // MARK: - 닉네임 변경
  void updateNickname(String value) {
    final error = _validate(value);

    state = state.copyWith(
      nickname: value,
      errorMessage: error,
      canSubmit: _computeCanSubmit(nickname: value, error: error),
    );
  }

  // MARK: - 이미지 선택
  Future<void> onImageTap() async {
    try {
      final file = await _imagePickerService.pickFromGallery();
      if (file == null) return;

      final compressed = await _imageCompressService.compress(file);

      state = state.copyWith(
        imageFile: compressed,
        canSubmit: true,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(canSubmit: false, errorMessage: '이미지 선택 실패');
    }
  }

  // MARK: - 저장
  Future<bool> submit() async {
    if (!state.canSubmit || state.isLoading) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final trimmedNickname = state.nickname.trim();

      final isNicknameChanged = trimmedNickname != _originalNickname;
      final isImageChanged = state.imageFile != null;

      if (isNicknameChanged) {
        await _updateProfileUseCase(nickname: trimmedNickname);
      }

      if (isImageChanged) {
        await _uploadProfileImageUseCase(state.imageFile!);
      }

      _originalNickname = trimmedNickname;

      state = state.copyWith(
        isLoading: false,
        imageFile: null,
        errorMessage: null,
        canSubmit: false,
      );

      return true;
    } catch (e) {
      var message = '저장 중 오류가 발생했어요';

      if (e is DioException) {
        final data = e.response?.data;

        if (data is Map && data['message'] != null) {
          final msg = data['message'];

          if (msg is String) {
            message = msg;
          } else if (msg is List && msg.isNotEmpty) {
            message = msg.first.toString();
          }
        }
      }

      state = state.copyWith(isLoading: false, errorMessage: message);

      return false;
    }
  }

  // MARK: - 유효성 검사
  String? _validate(String value) {
    if (value.isEmpty) return null;

    if (value != value.trim()) {
      return '닉네임 앞뒤에 공백은 사용할 수 없어요';
    }

    if (value.contains(' ')) {
      return '닉네임에는 공백을 사용할 수 없어요';
    }

    if (value.length < 2) {
      return '닉네임은 2자 이상 입력해주세요';
    }

    if (value.length > 8) {
      return '닉네임은 8자 이하로 입력해주세요';
    }

    final regex = RegExp(r'^[a-zA-Z0-9가-힣]+$');
    if (!regex.hasMatch(value)) {
      return '닉네임은 한글, 영어, 숫자만 가능해요';
    }

    return null;
  }

  // MARK: - 저장 가능 여부
  bool _computeCanSubmit({required String nickname, required String? error}) {
    final trimmedNickname = nickname.trim();
    final isNicknameChanged = trimmedNickname != _originalNickname;
    final isImageChanged = state.imageFile != null;

    return error == null &&
        trimmedNickname.isNotEmpty &&
        (isNicknameChanged || isImageChanged);
  }
}
