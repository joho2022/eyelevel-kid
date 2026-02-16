import 'package:flutter/foundation.dart';

import '../../../../domain/values/answer_style.dart';
import '../state/my_state.dart';

class MyViewModel extends ChangeNotifier {
  MyState state = MyState.initial();

  // ===== 프로필 이미지 =====
  void onProfileImageTap() {
    debugPrint('[MyViewModel] 프로필 이미지 클릭');


    notifyListeners();
  }

  // ===== 닉네임 =====
  void changeNickname(String nickname) {
    debugPrint('[MyViewModel] 닉네임 변경: $nickname');

    state = state.copyWith(
      nickname: nickname,
    );
    notifyListeners();
  }

  // ===== 질문 스타일 (이야기 / 이유) =====
  void changePreferredStyle(AnswerStyle style) {
    debugPrint('[MyViewModel] 질문 스타일 변경: $style');

    state = state.copyWith(
      answerStyle: style,
    );
    notifyListeners();
  }

  // ===== 앱 정보 =====
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

  // ===== 계정 =====
  void logout() {
    debugPrint('[MyViewModel] 로그아웃 클릭');
  }

  void withdraw() {
    debugPrint('[MyViewModel] 회원탈퇴 클릭');
  }
}