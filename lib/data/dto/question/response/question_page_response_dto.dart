import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/question_page.dart';
import 'question_response_dto.dart';

part 'question_page_response_dto.freezed.dart';
part 'question_page_response_dto.g.dart';

@freezed
abstract class QuestionPageResponseDto with _$QuestionPageResponseDto {
  const factory QuestionPageResponseDto({
    required List<QuestionResponseDto> items,
    String? nextCursor,
    required bool hasNext,
  }) = _QuestionPageResponseDto;

  factory QuestionPageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionPageResponseDtoFromJson(json);
}

extension QuestionPageResponseDtoMapper on QuestionPageResponseDto {
  QuestionPage toDomain() {
    return QuestionPage(
      items: items.map((e) => e.toDomain()).toList(),
      nextCursor: nextCursor,
      hasNext: hasNext,
    );
  }
}