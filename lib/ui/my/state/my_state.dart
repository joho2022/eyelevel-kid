import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/values/answer_style.dart';

part 'my_state.freezed.dart';

@freezed
abstract class MyState with _$MyState {
  const factory MyState({
    required String nickname,
    String? profileImagePath,
    required AnswerStyle answerStyle,
  }) = _MyState;

  factory MyState.initial() => const MyState(
    nickname: '카이',
    profileImagePath: null,
    answerStyle: AnswerStyle.story,
  );
}