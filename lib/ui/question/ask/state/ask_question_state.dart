import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/values/answer_style.dart';

part 'ask_question_state.freezed.dart';

@freezed
abstract class AskQuestionState with _$AskQuestionState {
  const factory AskQuestionState({
    @Default('') String question,
    @Default(AnswerStyle.story) AnswerStyle style,
    @Default(false) bool isLoading,
  }) = _AskQuestionState;
}