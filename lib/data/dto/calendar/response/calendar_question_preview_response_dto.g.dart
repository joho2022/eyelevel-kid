// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_question_preview_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarQuestionPreviewResponseDto
_$CalendarQuestionPreviewResponseDtoFromJson(Map<String, dynamic> json) =>
    _CalendarQuestionPreviewResponseDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CalendarQuestionPreviewResponseDtoToJson(
  _CalendarQuestionPreviewResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'createdAt': instance.createdAt.toIso8601String(),
};
