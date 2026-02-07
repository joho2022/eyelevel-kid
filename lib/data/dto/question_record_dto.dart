import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/question_record.dart';

part 'question_record_dto.freezed.dart';
part 'question_record_dto.g.dart';

@freezed
abstract class QuestionRecordDto with _$QuestionRecordDto {
  const factory QuestionRecordDto({
    required int id,
    required String title,
    required String answer,
    required String style,
    required String createdAt,
    required bool isBookmarked,
  }) = _QuestionRecordDto;

  factory QuestionRecordDto.fromJson(Map<String, dynamic> json)
  => _$QuestionRecordDtoFromJson(json);
}

extension QuestionRecordDtoMapper on QuestionRecordDto {
  QuestionRecord toEntity() {
    return QuestionRecord(
      id: id,
      title: title,
      answer: answer,
      style: AnswerStyle.values.byName(style),
      createdAt: DateTime.parse(createdAt),
      isBookmarked: isBookmarked,
    );
  }
}