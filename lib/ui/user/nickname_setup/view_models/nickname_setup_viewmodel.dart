import 'package:flutter/foundation.dart';

import '../../../../domain/usecases/save_nickname_use_case.dart';
import '../state/nickname_setup_state.dart';

class NicknameSetupViewModel extends ChangeNotifier {
  final SaveNicknameUseCase saveNicknameUseCase;

  NicknameSetupState state = const NicknameSetupState();

  NicknameSetupViewModel({
    required this.saveNicknameUseCase,
  });

  void updateNickname(String value) {
    final error = _validate(value);

    state = state.copyWith(
      nickname: value,
      errorMessage: error,
      canSubmit: error == null && value.isNotEmpty,
    );

    notifyListeners();
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

  Future<bool> submit() async {
    final cleaned = state.nickname.trim();
    final error = _validate(cleaned);

    if (error != null || cleaned.isEmpty) {
      state = state.copyWith(
        errorMessage: error ?? '닉네임을 입력해주세요',
        canSubmit: false,
      );
      notifyListeners();
      return false;
    }

    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      await saveNicknameUseCase(cleaned);

      state = state.copyWith(isLoading: false);
      notifyListeners();

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        canSubmit: false,
      );
      notifyListeners();

      return false;
    }
  }
}