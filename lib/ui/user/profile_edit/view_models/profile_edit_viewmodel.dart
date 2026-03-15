import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/image/image_compress_service.dart';
import '../../../../core/image/image_picker_service.dart';
import '../../../../domain/usecases/user/get_user_use_case.dart';
import '../../../../domain/usecases/user/update_profile_use_case.dart';
import '../../../../domain/usecases/user/upload_profile_image_Use_Case.dart';
import '../state/profile_edit_state.dart';

class ProfileEditViewModel extends ChangeNotifier {
  final UpdateProfileUseCase updateProfileUseCase;
  final GetUserUseCase getUserUseCase;
  final UploadProfileImageUseCase uploadProfileImageUseCase;

  final ImagePickerService imagePickerService;
  final ImageCompressService imageCompressService;

  late final String _originalNickname;

  ProfileEditState state = const ProfileEditState();

  ProfileEditViewModel({
    required this.updateProfileUseCase,
    required this.getUserUseCase,
    required this.uploadProfileImageUseCase,
    required this.imagePickerService,
    required this.imageCompressService,
  }) {
    _init();
  }

  void _init() {
    final user = getUserUseCase();

    _originalNickname = user.nickname;

    state = state.copyWith(
      nickname: user.nickname,
      imagePath: user.profileImagePath,
      imageFile: null,
      errorMessage: null,
      canSubmit: false,
    );

    notifyListeners();
  }

  void updateNickname(String value) {
    final error = _validate(value);

    state = state.copyWith(
      nickname: value,
      errorMessage: error,
      canSubmit: _computeCanSubmit(
        nickname: value,
        imagePath: state.imagePath,
        error: error,
      ),
    );

    notifyListeners();
  }

  Future<void> onImageTap() async {
    try {
      final file = await imagePickerService.pickFromGallery();
      if (file == null) return;

      final compressed = await imageCompressService.compress(file);

      state = state.copyWith(imageFile: compressed, canSubmit: true);

      notifyListeners();
    } catch (e) {
      state = state.copyWith(errorMessage: "이미지 선택 실패");
      notifyListeners();
    }
  }

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

  bool _computeCanSubmit({
    required String nickname,
    required String? imagePath,
    required String? error,
  }) {
    final isChanged = nickname != _originalNickname || state.imageFile != null;

    return error == null && nickname.isNotEmpty && isChanged;
  }

  Future<bool> submit() async {
    if (!state.canSubmit || state.isLoading) return false;

    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      String? imageUrl = state.imagePath;

      if (state.imageFile != null) {
        imageUrl = await uploadProfileImageUseCase(state.imageFile!);
      }

      await updateProfileUseCase(
        nickname: state.nickname.trim(),
        profileImagePath: imageUrl,
      );

      state = state.copyWith(isLoading: false);
      notifyListeners();

      return true;
    } catch (e) {

      String message = '저장 중 오류가 발생했어요';

      if (e is DioException) {
        message = e.response?.data['message'] ?? message;
      }

      state = state.copyWith(
        isLoading: false,
        errorMessage: message,
      );

      notifyListeners();

      return false;
    }
  }
}
