import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/token_repository.dart';
import '../../di/service_locator.dart';
import '../app_auth_state.dart';

final appAuthNotifierProvider = NotifierProvider<AppAuthNotifier, AppAuthState>(
  AppAuthNotifier.new,
);

class AppAuthNotifier extends Notifier<AppAuthState> {
  StreamSubscription<String?>? _subscription;

  bool _needsOnboarding = false;
  bool _isInitializing = true;
  bool _isInitialized = false;
  String? _pendingToken;
  late final TokenRepository _tokenRepository;

  // MARK: - Build
  @override
  AppAuthState build() {
    _tokenRepository = serviceLocator<TokenRepository>();

    _subscription = _tokenRepository.accessTokenStream.listen((token) {
      if (_isInitializing) {
        _pendingToken = token;
        return;
      }

      _applyAuthState(token);
    });

    ref.onDispose(() {
      _subscription?.cancel();
    });

    return const AppAuthState.splash();
  }

  // MARK: - 초기화
  Future<void> initialize() async {
    if (_isInitialized) return;

    await _tokenRepository.hydrate();

    _isInitializing = false;
    _isInitialized = true;

    _applyAuthState(_pendingToken);
  }

  // MARK: - 로그인 성공 처리
  Future<void> loginSuccess({
    required String access,
    required String refresh,
    required bool isNewUser,
  }) async {
    _needsOnboarding = isNewUser;

    await _tokenRepository.saveTokens(access, refresh);
  }

  // MARK: - 온보딩 완료
  void completeOnboarding() {
    _needsOnboarding = false;
    state = const AppAuthState.authenticated(needsOnboarding: false);
  }

  // MARK: - 인증 상태 반영
  void _applyAuthState(String? token) {
    state = token == null
        ? const AppAuthState.unauthenticated()
        : AppAuthState.authenticated(needsOnboarding: _needsOnboarding);
  }
}
