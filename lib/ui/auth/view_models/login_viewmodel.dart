import 'package:flutter/material.dart';
import '../../../core/auth/app_auth_viewmodel.dart';
import '../../../data/sources/external/social_auth_service.dart';
import '../../../domain/usecases/social_login_usecase.dart';
import '../state/login_state.dart';

class LoginViewModel extends ChangeNotifier {
  final SocialAuthService googleAuthDataSource;
  final SocialAuthService appleAuthDataSource;
  final SocialLoginUseCase socialLoginUseCase;
  final AppAuthViewModel appAuthViewModel;

  LoginState _state = const LoginState();

  LoginState get state => _state;

  LoginViewModel({
    required this.googleAuthDataSource,
    required this.appleAuthDataSource,
    required this.socialLoginUseCase,
    required this.appAuthViewModel,
  });

  Future<bool?> login(SocialProvider provider) async {
    if (_isLoading(provider)) return null;

    debugPrint('==== 로그인 시작 ====');
    debugPrint('provider: ${provider.name}');

    _setLoading(provider, true);

    try {
      final idToken = await _getIdToken(provider);

      debugPrint('==== idToken 발급 완료 ====');
      debugPrint('idToken: ${idToken.substring(0, 20)}...');

      final result = await socialLoginUseCase(provider.name, idToken);

      debugPrint('==== 서버 응답 ====');
      debugPrint('result: $result');

      final access = result['accessToken'];
      final refresh = result['refreshToken'];
      final isNewUser = result['isNewUser'];

      await appAuthViewModel.loginSuccess(
        access: access,
        refresh: refresh,
        isNewUser: isNewUser,
      );

      return isNewUser;
    } catch (e, stack) {
      debugPrint('🔥 로그인 에러 발생');
      debugPrint(e.toString());
      debugPrint(stack.toString());

      _state = _state.copyWith(errorMessage: '로그인에 실패했습니다.');
      notifyListeners();
      return null;
    } finally {
      _setLoading(provider, false);
    }
  }

  Future<String> _getIdToken(SocialProvider provider) {
    switch (provider) {
      case SocialProvider.google:
        return googleAuthDataSource.getIdToken();
      case SocialProvider.apple:
        return appleAuthDataSource.getIdToken();
    }
  }

  bool _isLoading(SocialProvider provider) {
    return provider == SocialProvider.google
        ? _state.isGoogleLoading
        : _state.isAppleLoading;
  }

  void _setLoading(SocialProvider provider, bool value) {
    _state = provider == SocialProvider.google
        ? _state.copyWith(isGoogleLoading: value)
        : _state.copyWith(isAppleLoading: value);

    notifyListeners();
  }

  void clearError() {
    _state = _state.copyWith(errorMessage: null);
    notifyListeners();
  }
}
