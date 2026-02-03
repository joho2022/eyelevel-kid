import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eyelevel_kid/domain/entities/calendar_summary.dart';

part 'calendar_summary_dto.freezed.dart';
part 'calendar_summary_dto.g.dart';

@freezed
abstract class CalendarSummaryDto with _$CalendarSummaryDto {
  const factory CalendarSummaryDto({
    required int year,
    required int month,

    @JsonKey(name: 'dates')
    required List<String> dateStrings,
  }) = _CalendarSummaryDto;

  factory CalendarSummaryDto.fromJson(Map<String, dynamic> json)
  => _$CalendarSummaryDtoFromJson(json);
}

extension CalendarSummaryDtoMapper on CalendarSummaryDto {
  CalendarSummary toEntity() {
    return CalendarSummary(
      year: year,
      month: month,
      questionDates: dateStrings.map(DateTime.parse).toSet(),
    );
  }
}