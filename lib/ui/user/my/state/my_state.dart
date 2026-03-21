import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/values/answer_style.dart';


part 'my_state.freezed.dart';

@freezed
abstract class MyState with _$MyState {
  const factory MyState({
    required String nickname,
    String? profileImageUrl,
    required AnswerStyle answerStyle,
    required bool isLoading,
    required String appVersion,

    String? errorMessage,
  }) = _MyState;

  factory MyState.initial() => const MyState(
    nickname: '',
    profileImageUrl: null,
    answerStyle: AnswerStyle.story,
    isLoading: false,
    appVersion: '',
    errorMessage: null,
  );
}