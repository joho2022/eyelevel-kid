import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/auth/logout_usecase.dart';
import '../../../../domain/usecases/auth/withdraw_usecase.dart';
import '../../../../domain/usecases/user/fetch_user_use_case.dart';
import '../../../../domain/usecases/user/observe_user_use_case.dart';
import '../../../../domain/usecases/user/refresh_profile_image_url_use_case.dart';
import '../../../../domain/usecases/user/update_answer_style_use_case.dart';
import '../../../../domain/values/answer_style.dart';
import '../state/my_state.dart';

class MyViewModel extends ChangeNotifier {
  final ObserveUserUseCase observeUserUseCase;
  final FetchUserUseCase fetchUserUseCase;
  final RefreshProfileImageUrlUseCase refreshProfileImageUrlUseCase;
  final UpdateAnswerStyleUseCase updateAnswerStyleUseCase;
  final LogoutUseCase logoutUseCase;
  final WithdrawUseCase withdrawUseCase;

  MyState state = MyState.initial();

  StreamSubscription<User>? _subscription;

  bool _isRefreshingProfileImageUrl = false;

  MyViewModel({
    required this.observeUserUseCase,
    required this.fetchUserUseCase,
    required this.refreshProfileImageUrlUseCase,
    required this.updateAnswerStyleUseCase,
    required this.logoutUseCase,
    required this.withdrawUseCase,
  }) {
    _init();
  }

  // MARK: - 초기화
  void _init() {
    _observeUser();
    _fetchUser();
    _loadAppVersion();
  }

  // MARK: - 유저 정보 조회
  Future<void> _fetchUser() async {
    try {
      await fetchUserUseCase();
    } catch (e) {
      debugPrint('fetchUser error: $e');

      state = state.copyWith(errorMessage: '유저 정보를 불러오지 못했습니다');
      notifyListeners();
    }
  }

  // MARK: - 유저 상태 구독
  void _observeUser() {
    _subscription = observeUserUseCase().listen((user) {
      state = state.copyWith(
        nickname: user.nickname,
        profileImageUrl: user.profileImageUrl,
        answerStyle: user.answerStyle,
      );

      notifyListeners();
    });
  }

  // MARK: - 프로필 이미지 URL 재발급
  Future<void> refreshProfileImageUrl() async {
    if (_isRefreshingProfileImageUrl) return;

    _isRefreshingProfileImageUrl = true;

    try {
      await refreshProfileImageUrlUseCase();

    } catch (e) {
      debugPrint('refreshProfileImageUrl error: $e');

      state = state.copyWith(errorMessage: '프로필 이미지 URL을 새로 불러오지 못했습니다');
      notifyListeners();
    } finally {
      _isRefreshingProfileImageUrl = false;
    }
  }

  // MARK: - 질문 스타일 변경
  Future<void> changePreferredStyle(AnswerStyle style) async {
    try {
      await updateAnswerStyleUseCase(style);
    } catch (e) {
      debugPrint('changePreferredStyle error: $e');

      state = state.copyWith(errorMessage: '답변 스타일 변경에 실패했습니다');
      notifyListeners();
    }
  }

  // MARK: - 앱 정보
  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();

    state = state.copyWith(appVersion: '${info.version} (${info.buildNumber})');

    notifyListeners();
  }

  Future<void> onTapRateApp() async {
    final url = _getStoreUrl();
    if (url == null) return;

    final uri = Uri.parse(url);

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('스토어 이동 실패: $e');
    }
  }

  // MARK: - 앱주소 바꾸기
  String? _getStoreUrl() {
    if (Platform.isIOS) {
      return 'https://apps.apple.com/app/id6741756312?action=write-review';
    } else if (Platform.isAndroid) {
      return 'market://details?id=com.your.package';
    }
    return null;
  }

  Future<void> onTapShareApp() async {
    final params = ShareParams(text: _shareMessage(), title: '아이시선 공유');

    try {
      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        debugPrint('공유 성공');
      } else if (result.status == ShareResultStatus.dismissed) {
        debugPrint('공유 취소');
      }
    } catch (e) {
      debugPrint('공유 실패: $e');
    }
  }

  // MARK: - 앱주소 바꾸기
  String _shareMessage() {
    return '''
아이시선 앱 추천합니다 👀

아이의 눈높이에서 질문에 답해주는 앱이에요!
지금 한번 써보세요 👍

https://yourapp.link
''';
  }

  Future<void> onTapContact() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'josama2022.dev@gmail.com',
      query: _buildQuery(),
    );

    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint('문의하기 실패: $e');
    }
  }

  String _buildQuery() {
    final subject = Uri.encodeComponent('[아이시선] 문의드립니다');
    final body = Uri.encodeComponent(_buildBody());

    return 'subject=$subject&body=$body';
  }

  String _buildBody() {
    return '''
안녕하세요.

문의 내용을 작성해주세요.

----
앱 버전: ${state.appVersion}
기기: ${Platform.operatingSystem}
''';
  }

  // MARK: - 계정
  Future<bool> logout() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      await logoutUseCase();
      return true;
    } catch (e) {
      debugPrint('logout error: $e');

      state = state.copyWith(errorMessage: '로그아웃에 실패했습니다');

      return false;
    } finally {
      state = state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> withdraw() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      await withdrawUseCase();
    } catch (e) {
      debugPrint('withdraw error: $e');

      state = state.copyWith(errorMessage: '회원탈퇴에 실패했습니다');
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
