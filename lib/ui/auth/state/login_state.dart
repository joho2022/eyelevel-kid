import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum SocialProvider {
  google,
  apple,
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isGoogleLoading,
    @Default(false) bool isAppleLoading,
    String? errorMessage,
  }) = _LoginState;
}