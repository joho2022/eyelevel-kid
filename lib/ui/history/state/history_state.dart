import '../../../domain/entities/question_record.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default({}) Map<int, List<QuestionRecord>> groupedByYear,
    @Default(HistoryFilter.all) HistoryFilter filter,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    String? nextCursor,
    @Default(true) bool hasNext,
  }) = _HistoryState;
}

enum HistoryFilter {
  all,
  bookmarked,
}