import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_auth_state.freezed.dart';

@freezed
class AppAuthState with _$AppAuthState {
  const factory AppAuthState.splash() = _Splash;

  const factory AppAuthState.unauthenticated() = _Unauthenticated;

  const factory AppAuthState.authenticated({
    required bool needsOnboarding,
  }) = _Authenticated;

  const factory AppAuthState.error(String message) = _Error;
}