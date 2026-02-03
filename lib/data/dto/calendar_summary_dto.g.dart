// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarSummaryDto _$CalendarSummaryDtoFromJson(Map<String, dynamic> json) =>
    _CalendarSummaryDto(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      dateStrings: (json['dates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CalendarSummaryDtoToJson(_CalendarSummaryDto instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'dates': instance.dateStrings,
    };
