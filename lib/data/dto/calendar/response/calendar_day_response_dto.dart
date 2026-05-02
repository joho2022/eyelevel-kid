import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/utils/date_format.dart';
import '../../../../domain/entities/calendar_day_summary.dart';
import 'calendar_question_preview_response_dto.dart';

part 'calendar_day_response_dto.freezed.dart';
part 'calendar_day_response_dto.g.dart';

@freezed
abstract class CalendarDayResponseDto with _$CalendarDayResponseDto {
  const factory CalendarDayResponseDto({
    required String date,
    required List<CalendarQuestionPreviewResponseDto> questions,
  }) = _CalendarDayResponseDto;

  factory CalendarDayResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarDayResponseDtoFromJson(json);
}

extension CalendarDayResponseDtoMapper on CalendarDayResponseDto {
  CalendarDaySummary toDomain() {
    return CalendarDaySummary(
      date: DateFormat.parseCalendarDate(date),
      questions: questions.map((question) => question.toDomain()).toList(),
    );
  }
}
