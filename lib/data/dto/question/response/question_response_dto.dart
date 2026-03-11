import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/question_record.dart';
import '../../../../domain/values/answer_style.dart';

part 'question_response_dto.freezed.dart';
part 'question_response_dto.g.dart';

@freezed
abstract class QuestionResponseDto with _$QuestionResponseDto {
  const factory QuestionResponseDto({
    required int id,
    required String title,
    required String answer,
    required AnswerStyle style,
    required DateTime createdAt,
    required bool isBookmarked,
  }) = _QuestionResponseDto;

  factory QuestionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseDtoFromJson(json);
}

extension QuestionResponseDtoMapper on QuestionResponseDto {
  QuestionRecord toDomain() {
    return QuestionRecord(
      id: id,
      title: title,
      answer: answer,
      style: style,
      createdAt: createdAt.toLocal(),
      isBookmarked: isBookmarked,
    );
  }
}