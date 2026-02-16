import 'package:freezed_annotation/freezed_annotation.dart';

part 'nickname_setup_state.freezed.dart';

@freezed
abstract class NicknameSetupState with _$NicknameSetupState {
  const factory NicknameSetupState({
    @Default('') String nickname,
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool canSubmit,
  }) = _NicknameSetupState;
}