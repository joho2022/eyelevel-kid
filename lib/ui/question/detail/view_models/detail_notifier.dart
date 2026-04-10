import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../domain/usecases/question/get_question_use_case.dart';
import '../../../../domain/usecases/question/toggle_bookmark_use_case.dart';
import '../state/detail_state.dart';

final detailNotifierProvider =
    NotifierProvider.autoDispose.family<DetailNotifier, DetailState, int>(
      DetailNotifier.new,
    );

class DetailNotifier extends Notifier<DetailState> {
  DetailNotifier(this.questionId);

  final int questionId;
  late final GetQuestionUseCase _getQuestionUseCase;
  late final ToggleBookmarkUseCase _toggleBookmarkUseCase;
  bool _initialized = false;

  // MARK: - Build
  @override
  DetailState build() {
    _getQuestionUseCase = serviceLocator<GetQuestionUseCase>();
    _toggleBookmarkUseCase = serviceLocator<ToggleBookmarkUseCase>();

    if (!_initialized) {
      _initialized = true;
      Future.microtask(() => _load(questionId));
    }

    return const DetailState(record: null);
  }

  // MARK: - 질문 로드
  Future<void> _load(int id) async {
    try {
      final record = await _getQuestionUseCase(id);

      state = state.copyWith(record: record, isInitialLoading: false);
    } catch (e) {
      debugPrint('[DetailNotifier] 질문 로드 실패: $e');
      state = state.copyWith(isInitialLoading: false);
    }
  }

  // MARK: - 북마크 토글
  Future<void> toggleBookmark() async {
    final id = state.record?.id;
    if (id == null) return;

    try {
      final updatedRecord = await _toggleBookmarkUseCase(id);
      state = state.copyWith(record: updatedRecord);
    } catch (e) {
      debugPrint('북마크 실패: $e');
    }
  }
}
