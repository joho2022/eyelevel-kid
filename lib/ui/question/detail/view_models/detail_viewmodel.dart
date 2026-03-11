import 'package:flutter/foundation.dart';

import '../../../../domain/usecases/question/get_question_use_case.dart';
import '../../../../domain/usecases/question/toggle_bookmark_usecase.dart';
import '../state/detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final GetQuestionUseCase getQuestionUseCase;
  final ToggleBookmarkUseCase toggleBookmarkUseCase;

  DetailState state = const DetailState(record: null);

  DetailViewModel({
    required int questionId,
    required this.getQuestionUseCase,
    required this.toggleBookmarkUseCase,
  }) {
    _load(questionId);
  }

  Future<void> _load(int id) async {
    try {
      final record = await getQuestionUseCase(id);

      state = state.copyWith(
        record: record,
        isInitialLoading: false,
      );

      notifyListeners();
    } catch (e) {
      debugPrint('[DetailViewModel] 질문 로드 실패: $e');

      state = state.copyWith(
        isInitialLoading: false,
      );

      notifyListeners();
    }
  }

  Future<void> toggleBookmark() async {
    debugPrint('[DetailViewModel] 북마크 토글 시작');

    final id = state.record?.id;
    if (id == null) return;

    try {
      final updatedRecord = await toggleBookmarkUseCase(id);

      state = state.copyWith(record: updatedRecord);
      notifyListeners();
    } catch (e) {
      debugPrint('북마크 실패: $e');
    }
  }

}