import 'dart:async';

import 'package:flutter/material.dart';
import '../../domain/repositories/token_repository.dart';
import 'app_auth_state.dart';

class AppAuthViewModel extends ChangeNotifier {
  final TokenRepository tokenRepository;
  late final StreamSubscription _subscription;

  AppAuthState _state = const AppAuthState.splash();

  AppAuthState get state => _state;

  bool _needsOnboarding = false;

  bool _isInitializing = true;
  bool _isInitialized = false;
  String? _pendingToken;

  AppAuthViewModel(this.tokenRepository) {
    _subscription = tokenRepository.accessTokenStream.listen((token) {
      if (_isInitializing) {
        _pendingToken = token;
        return;
      }

      _applyAuthState(token);
    });
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    await tokenRepository.hydrate();

    _isInitializing = false;
    _isInitialized = true;

    _applyAuthState(_pendingToken);
  }

  void _applyAuthState(String? token) {
    if (token == null) {
      _state = const AppAuthState.unauthenticated();
    } else {
      _state = AppAuthState.authenticated(needsOnboarding: _needsOnboarding);
    }

    notifyListeners();
  }

  Future<void> loginSuccess({
    required String access,
    required String refresh,
    required bool isNewUser,
  }) async {
    _needsOnboarding = isNewUser;

    await tokenRepository.saveTokens(access, refresh);
  }

  void completeOnboarding() {
    _needsOnboarding = false;

    _state = const AppAuthState.authenticated(needsOnboarding: false);

    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
