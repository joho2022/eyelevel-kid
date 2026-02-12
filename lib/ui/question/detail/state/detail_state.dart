import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/question_record.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    required QuestionRecord? record,
    @Default(false) bool isInitialLoading,
  }) = _DetailState;

  factory DetailState.initial(QuestionRecord record) =>
      DetailState(record: record);
}