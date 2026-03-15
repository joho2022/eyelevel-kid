import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/user/fetch_user_use_case.dart';
import '../../../../domain/usecases/user/observe_user_use_case.dart';
import '../../../../domain/usecases/user/update_answer_style_use_case.dart';
import '../../../../domain/values/answer_style.dart';
import '../state/my_state.dart';

class MyViewModel extends ChangeNotifier {
  final ObserveUserUseCase observeUserUseCase;
  final FetchUserUseCase fetchUserUseCase;
  final UpdateAnswerStyleUseCase updateAnswerStyleUseCase;

  MyState state = MyState.initial();

  StreamSubscription<User>? _subscription;

  MyViewModel({
    required this.observeUserUseCase,
    required this.fetchUserUseCase,
    required this.updateAnswerStyleUseCase,
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
  void logout() {
    debugPrint('[MyViewModel] 로그아웃 클릭');
  }

  void withdraw() {
    debugPrint('[MyViewModel] 회원탈퇴 클릭');
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}