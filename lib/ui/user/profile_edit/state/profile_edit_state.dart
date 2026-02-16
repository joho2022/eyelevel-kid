import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_state.freezed.dart';

@freezed
abstract class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default('') String nickname,
    String? errorMessage,
    String? imagePath,
    @Default(false) bool isLoading,
    @Default(false) bool canSubmit,
  }) = _ProfileEditState;
}