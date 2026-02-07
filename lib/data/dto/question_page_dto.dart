import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/question_page.dart';
import 'question_record_dto.dart';

part 'question_page_dto.freezed.dart';
part 'question_page_dto.g.dart';

@freezed
abstract class QuestionPageDto with _$QuestionPageDto {
  const factory QuestionPageDto({
    required List<QuestionRecordDto> items,
    String? nextCursor,
    required bool hasNext,
  }) = _QuestionPageDto;

  factory QuestionPageDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionPageDtoFromJson(json);
}

extension QuestionPageDtoMapper on QuestionPageDto {
  QuestionPage toEntity() {
    return QuestionPage(
      items: items.map((e) => e.toEntity()).toList(),
      nextCursor: nextCursor,
      hasNext: hasNext,
    );
  }
}