import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/token_repository.dart';
import '../../../domain/usecases/user/fetch_user_use_case.dart';
import '../../../domain/usecases/user/get_user_use_case.dart';
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
  late final FetchUserUseCase _fetchUserUseCase;
  late final GetUserUseCase _getUserUseCase;

  // MARK: - Build
  @override
  AppAuthState build() {
    _tokenRepository = serviceLocator<TokenRepository>();
    _fetchUserUseCase = serviceLocator<FetchUserUseCase>();
    _getUserUseCase = serviceLocator<GetUserUseCase>();

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
    _pendingToken = await _tokenRepository.getAccessToken();

    await _resolveOnboardingState();

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

  Future<void> _resolveOnboardingState() async {
    if (_pendingToken == null) {
      _needsOnboarding = false;
      return;
    }

    try {
      await _fetchUserUseCase();
    } catch (e, stack) {
      debugPrint('🔥 사용자 정보 조회 실패');
      debugPrint(e.toString());
      debugPrint(stack.toString());

      final latestToken = await _tokenRepository.getAccessToken();
      if (latestToken == null) {
        _pendingToken = null;
        _needsOnboarding = false;
        return;
      }
    }

    final user = _getUserUseCase();
    _needsOnboarding = user.nickname.trim().isEmpty;
  }

  // MARK: - 인증 상태 반영
  void _applyAuthState(String? token) {
    state = token == null
        ? const AppAuthState.unauthenticated()
        : AppAuthState.authenticated(needsOnboarding: _needsOnboarding);
  }
}
