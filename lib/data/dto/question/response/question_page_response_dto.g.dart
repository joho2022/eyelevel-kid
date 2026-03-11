// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_page_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionPageResponseDto _$QuestionPageResponseDtoFromJson(
  Map<String, dynamic> json,
) => _QuestionPageResponseDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => QuestionResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['nextCursor'] as String?,
  hasNext: json['hasNext'] as bool,
);

Map<String, dynamic> _$QuestionPageResponseDtoToJson(
  _QuestionPageResponseDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'nextCursor': instance.nextCursor,
  'hasNext': instance.hasNext,
};
