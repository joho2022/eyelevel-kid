import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/view_models/app_auth_notifier.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/sources/external/apple_auth_service.dart';
import '../../../data/sources/external/google_auth_service.dart';
import '../../../data/sources/external/social_auth_service.dart';
import '../../../domain/usecases/auth/social_login_usecase.dart';
import '../state/login_state.dart';

final loginNotifierProvider =
    NotifierProvider.autoDispose<LoginNotifier, LoginState>(
      LoginNotifier.new,
    );

class LoginNotifier extends Notifier<LoginState> {
  late final SocialLoginUseCase _socialLoginUseCase;
  late final SocialAuthService _googleAuthService;
  late final SocialAuthService _appleAuthService;

  // MARK: - Build
  @override
  LoginState build() {
    _socialLoginUseCase = serviceLocator<SocialLoginUseCase>();
    _googleAuthService = serviceLocator<GoogleAuthService>();
    _appleAuthService = serviceLocator<AppleAuthService>();

    return const LoginState();
  }

  // MARK: - 로그인
  Future<bool?> login(SocialProvider provider) async {
    if (_isLoading(provider)) return null;

    debugPrint('==== 로그인 시작 ====');
    debugPrint('provider: ${provider.name}');

    _setLoading(provider, true);

    try {
      final idToken = await _getIdToken(provider);

      debugPrint('==== idToken 발급 완료 ====');
      debugPrint('idToken: ${idToken.substring(0, 20)}...');

      final result = await _socialLoginUseCase(provider.name, idToken);

      debugPrint('==== 서버 응답 ====');
      debugPrint('result: $result');

      final access = result['accessToken'] as String;
      final refresh = result['refreshToken'] as String;
      final isNewUser = result['isNewUser'] as bool;

      await ref
          .read(appAuthNotifierProvider.notifier)
          .loginSuccess(access: access, refresh: refresh, isNewUser: isNewUser);

      return isNewUser;
    } catch (e, stack) {
      debugPrint('🔥 로그인 에러 발생');
      debugPrint(e.toString());
      debugPrint(stack.toString());

      state = state.copyWith(errorMessage: '로그인에 실패했습니다.');
      return null;
    } finally {
      _setLoading(provider, false);
    }
  }

  // MARK: - 에러 초기화
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  // MARK: - ID Token 조회
  Future<String> _getIdToken(SocialProvider provider) {
    switch (provider) {
      case SocialProvider.google:
        return _googleAuthService.getIdToken();
      case SocialProvider.apple:
        return _appleAuthService.getIdToken();
    }
  }

  // MARK: - 로딩 상태 확인
  bool _isLoading(SocialProvider provider) {
    return provider == SocialProvider.google
        ? state.isGoogleLoading
        : state.isAppleLoading;
  }

  // MARK: - 로딩 상태 변경
  void _setLoading(SocialProvider provider, bool value) {
    state = provider == SocialProvider.google
        ? state.copyWith(isGoogleLoading: value)
        : state.copyWith(isAppleLoading: value);
  }
}
