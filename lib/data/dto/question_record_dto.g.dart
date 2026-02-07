// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionRecordDto _$QuestionRecordDtoFromJson(Map<String, dynamic> json) =>
    _QuestionRecordDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      answer: json['answer'] as String,
      style: json['style'] as String,
      createdAt: json['createdAt'] as String,
      isBookmarked: json['isBookmarked'] as bool,
    );

Map<String, dynamic> _$QuestionRecordDtoToJson(_QuestionRecordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'answer': instance.answer,
      'style': instance.style,
      'createdAt': instance.createdAt,
      'isBookmarked': instance.isBookmarked,
    };
