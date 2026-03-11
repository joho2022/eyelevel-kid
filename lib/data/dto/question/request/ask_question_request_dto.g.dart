// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_question_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AskQuestionRequestDto _$AskQuestionRequestDtoFromJson(
  Map<String, dynamic> json,
) => _AskQuestionRequestDto(
  question: json['question'] as String,
  style: $enumDecode(_$AnswerStyleEnumMap, json['style']),
);

Map<String, dynamic> _$AskQuestionRequestDtoToJson(
  _AskQuestionRequestDto instance,
) => <String, dynamic>{
  'question': instance.question,
  'style': _$AnswerStyleEnumMap[instance.style]!,
};

const _$AnswerStyleEnumMap = {
  AnswerStyle.story: 'story',
  AnswerStyle.reason: 'reason',
};
