// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionPageDto _$QuestionPageDtoFromJson(Map<String, dynamic> json) =>
    _QuestionPageDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => QuestionRecordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$QuestionPageDtoToJson(_QuestionPageDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': instance.nextCursor,
      'hasNext': instance.hasNext,
    };
