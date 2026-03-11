// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_day_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarDayResponseDto _$CalendarDayResponseDtoFromJson(
  Map<String, dynamic> json,
) => _CalendarDayResponseDto(
  date: json['date'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map(
        (e) => CalendarQuestionPreviewResponseDto.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$CalendarDayResponseDtoToJson(
  _CalendarDayResponseDto instance,
) => <String, dynamic>{'date': instance.date, 'questions': instance.questions};
