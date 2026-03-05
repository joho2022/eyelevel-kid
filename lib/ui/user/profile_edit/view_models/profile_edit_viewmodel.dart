import 'package:flutter/foundation.dart';

import '../../../../domain/usecases/get_user_use_case.dart';
import '../../../../domain/usecases/user/save_profile_use_case.dart';
import '../state/profile_edit_state.dart';

class ProfileEditViewModel extends ChangeNotifier {
  final SaveProfileUseCase saveProfileUseCase;
  final GetUserUseCase getUserUseCase;

  late final String _originalNickname;
  late final String? _originalImagePath;

  ProfileEditState state = const ProfileEditState();

  ProfileEditViewModel({
    required this.saveProfileUseCase,
    required this.getUserUseCase,
  }) {
    _init();
  }

  void _init() {
    final user = getUserUseCase();

    _originalNickname = user.nickname;
    _originalImagePath = user.profileImagePath;

    state = state.copyWith(
      nickname: user.nickname,
      imagePath: user.profileImagePath,
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

  void updateImage(String path) {
    state = state.copyWith(
      imagePath: path,
      canSubmit: _computeCanSubmit(
        nickname: state.nickname,
        imagePath: path,
        error: state.errorMessage,
      ),
    );

    notifyListeners();
  }

  void onImageTap() {
    /// 실제로는 이미지 피커 열면 됨
    updateImage('assets/sample_profile.png');
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
    final isChanged =
        nickname != _originalNickname ||
            imagePath != _originalImagePath;

    return error == null &&
        nickname.isNotEmpty &&
        isChanged;
  }

  Future<bool> submit() async {
    if (!state.canSubmit || state.isLoading) return false;

    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      await saveProfileUseCase(
        nickname: state.nickname.trim(),
        profileImagePath: state.imagePath,
      );

      state = state.copyWith(isLoading: false);
      notifyListeners();

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '저장 중 오류가 발생했어요',
      );
      notifyListeners();

      return false;
    }
  }
}