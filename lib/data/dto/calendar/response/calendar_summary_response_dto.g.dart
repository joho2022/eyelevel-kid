// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_summary_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarSummaryResponseDto _$CalendarSummaryResponseDtoFromJson(
  Map<String, dynamic> json,
) => _CalendarSummaryResponseDto(
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  questionDates: (json['questionDates'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CalendarSummaryResponseDtoToJson(
  _CalendarSummaryResponseDto instance,
) => <String, dynamic>{
  'year': instance.year,
  'month': instance.month,
  'questionDates': instance.questionDates,
};
