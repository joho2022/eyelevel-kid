import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/calendar_summary.dart';

part 'calendar_summary_response_dto.freezed.dart';
part 'calendar_summary_response_dto.g.dart';

@freezed
abstract class CalendarSummaryResponseDto with _$CalendarSummaryResponseDto {
  const factory CalendarSummaryResponseDto({
    required int year,
    required int month,
    required List<String> questionDates,
  }) = _CalendarSummaryResponseDto;

  factory CalendarSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarSummaryResponseDtoFromJson(json);
}

extension CalendarSummaryResponseDtoMapper on CalendarSummaryResponseDto {

  CalendarSummary toDomain() {
    return CalendarSummary(
      year: year,
      month: month,
      questionDates: questionDates
          .map((dateString) => DateTime.parse(dateString).toLocal())
          .toSet(),
    );
  }
}