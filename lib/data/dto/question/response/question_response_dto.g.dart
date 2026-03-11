// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionResponseDto _$QuestionResponseDtoFromJson(Map<String, dynamic> json) =>
    _QuestionResponseDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      answer: json['answer'] as String,
      style: $enumDecode(_$AnswerStyleEnumMap, json['style']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isBookmarked: json['isBookmarked'] as bool,
    );

Map<String, dynamic> _$QuestionResponseDtoToJson(
  _QuestionResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'answer': instance.answer,
  'style': _$AnswerStyleEnumMap[instance.style]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'isBookmarked': instance.isBookmarked,
};

const _$AnswerStyleEnumMap = {
  AnswerStyle.story: 'story',
  AnswerStyle.reason: 'reason',
};
