import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/auth/logout_usecase.dart';
import '../../../../domain/usecases/auth/withdraw_usecase.dart';
import '../../../../domain/usecases/user/fetch_user_use_case.dart';
import '../../../../domain/usecases/user/observe_user_use_case.dart';
import '../../../../domain/usecases/user/update_answer_style_use_case.dart';
import '../../../../domain/values/answer_style.dart';
import '../state/my_state.dart';

class MyViewModel extends ChangeNotifier {
  final ObserveUserUseCase observeUserUseCase;
  final FetchUserUseCase fetchUserUseCase;
  final UpdateAnswerStyleUseCase updateAnswerStyleUseCase;
  final LogoutUseCase logoutUseCase;
  final WithdrawUseCase withdrawUseCase;

  MyState state = MyState.initial();

  StreamSubscription<User>? _subscription;

  MyViewModel({
    required this.observeUserUseCase,
    required this.fetchUserUseCase,
    required this.updateAnswerStyleUseCase,
    required this.logoutUseCase,
    required this.withdrawUseCase,
  }) {
    _init();
  }

  // MARK: - 초기화
  void _init() {
    _observeUser();
    fetchUserUseCase();
  }

  // MARK: - 유저 상태 구독
  void _observeUser() {
    _subscription = observeUserUseCase().listen((user) {
      state = state.copyWith(
        nickname: user.nickname,
        profileImage: user.profileImage,
        answerStyle: user.answerStyle,
      );

      notifyListeners();
    });
  }

  // MARK: - 질문 스타일 변경
  Future<void> changePreferredStyle(AnswerStyle style) async {
    await updateAnswerStyleUseCase(style);
  }

  // MARK: - 앱 정보
  void onTapAppVersion() {
    debugPrint('[MyViewModel] 앱 버전 클릭');
  }

  void onTapRateApp() {
    debugPrint('[MyViewModel] 평가하기 클릭');
  }

  void onTapShareApp() {
    debugPrint('[MyViewModel] 공유하기 클릭');
  }

  void onTapContact() {
    debugPrint('[MyViewModel] 문의하기 클릭');
  }

  // MARK: - 계정
  Future<bool> logout() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      await logoutUseCase();
      return true;
    } catch (e) {
      debugPrint("logout error: $e");

      state = state.copyWith(
        errorMessage: "로그아웃에 실패했습니다",
      );

      return false;
    } finally {
      state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<bool> withdraw() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      await withdrawUseCase();
      return true;
    } catch (e) {
      debugPrint("withdraw error: $e");

      state = state.copyWith(
        errorMessage: "회원탈퇴에 실패했습니다",
      );

      return false;
    } finally {
      state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
