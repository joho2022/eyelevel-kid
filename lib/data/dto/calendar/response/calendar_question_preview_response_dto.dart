import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/calendar_day_summary.dart';

part 'calendar_question_preview_response_dto.freezed.dart';
part 'calendar_question_preview_response_dto.g.dart';

@freezed
abstract class CalendarQuestionPreviewResponseDto
    with _$CalendarQuestionPreviewResponseDto {
  const factory CalendarQuestionPreviewResponseDto({
    required int id,
    required String title,
    required DateTime createdAt,
  }) = _CalendarQuestionPreviewResponseDto;

  factory CalendarQuestionPreviewResponseDto.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$CalendarQuestionPreviewResponseDtoFromJson(json);
}

extension CalendarQuestionPreviewResponseDtoMapper
on CalendarQuestionPreviewResponseDto {

  CalendarQuestionPreview toDomain() {
    return CalendarQuestionPreview(
      id: id,
      title: title,
      createdAt: createdAt.toLocal(),
    );
  }
}