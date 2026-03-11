import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/values/answer_style.dart';

part 'ask_question_request_dto.freezed.dart';
part 'ask_question_request_dto.g.dart';

@freezed
abstract class AskQuestionRequestDto with _$AskQuestionRequestDto {
  const factory AskQuestionRequestDto({
    required String question,
    required AnswerStyle style,
  }) = _AskQuestionRequestDto;

  factory AskQuestionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AskQuestionRequestDtoFromJson(json);
}