import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/image/image_compress_service.dart';
import '../../../../core/image/image_picker_service.dart';
import '../../../../domain/usecases/user/get_user_use_case.dart';
import '../../../../domain/usecases/user/update_profile_use_case.dart';
import '../../../../domain/usecases/user/upload_profile_image_use_case.dart';
import '../state/profile_edit_state.dart';

class ProfileEditViewModel extends ChangeNotifier {
  final UpdateProfileUseCase updateProfileUseCase;
  final GetUserUseCase getUserUseCase;
  final UploadProfileImageUseCase uploadProfileImageUseCase;

  final ImagePickerService imagePickerService;
  final ImageCompressService imageCompressService;

  late String _originalNickname;

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
      imagePath: user.profileImageUrl,
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

      state = state.copyWith(
        imageFile: compressed,
        canSubmit: true,
        errorMessage: null,
      );

      notifyListeners();
    } catch (e) {
      debugPrint('이미지 선택 실패: $e');

      state = state.copyWith(
        canSubmit: false,
        errorMessage: '이미지 선택 실패',
      );

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
    required String? error,
  }) {
    final trimmedNickname = nickname.trim();

    final isNicknameChanged = trimmedNickname != _originalNickname;
    final isImageChanged = state.imageFile != null;

    return error == null &&
        trimmedNickname.isNotEmpty &&
        (isNicknameChanged || isImageChanged);
  }

  Future<bool> submit() async {
    if (!state.canSubmit || state.isLoading) return false;

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    notifyListeners();

    try {
      final trimmedNickname = state.nickname.trim();

      final isNicknameChanged = trimmedNickname != _originalNickname;
      final isImageChanged = state.imageFile != null;

      // [변경] 닉네임 수정
      // updateProfileUseCase는 이제 nickname / profileImageKey 구조지만
      // 여기서는 닉네임만 수정하므로 nickname만 전달
      if (isNicknameChanged) {
        await updateProfileUseCase(
          nickname: trimmedNickname,
        );
      }

      // [변경] 이미지 수정
      // uploadProfileImageUseCase 내부에서
      // 1. 업로드 URL 발급
      // 2. S3 업로드
      // 3. key 저장
      // 4. local user 갱신
      // 까지 완료함
      if (isImageChanged) {
        await uploadProfileImageUseCase(state.imageFile!);
      }

      // [변경] 저장 성공 후 기준값 갱신
      _originalNickname = trimmedNickname;

      state = state.copyWith(
        isLoading: false,
        imageFile: null,
        errorMessage: null,
        canSubmit: false,
      );
      notifyListeners();

      return true;
    } catch (e) {
      String message = '저장 중 오류가 발생했어요';

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

      state = state.copyWith(
        isLoading: false,
        errorMessage: message,
      );

      notifyListeners();

      return false;
    }
  }
}
