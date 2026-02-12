import 'package:flutter/foundation.dart';

import '../../../../domain/usecases/get_question_use_case.dart';
import '../../../../domain/usecases/toggle_bookmark_usecase.dart';
import '../state/detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final GetQuestionUseCase getQuestionUseCase;
  final ToggleBookmarkUseCase toggleBookmarkUseCase;

  DetailState state = const DetailState(record: null,  isInitialLoading: true,);

  DetailViewModel({
    required int questionId,
    required this.getQuestionUseCase,
    required this.toggleBookmarkUseCase,
  }) {
    _load(questionId);
  }

  Future<void> _load(int id) async {
    final record = await getQuestionUseCase(id);

    state = state.copyWith(
      record: record,
      isInitialLoading: false,
    );

    notifyListeners();
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

  void askAgain() {
    debugPrint('[DetailViewModel] 다시 질문하기 클릭');
  }
}