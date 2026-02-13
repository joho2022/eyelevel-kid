import 'package:flutter/foundation.dart';

import '../../../../domain/entities/question_record.dart';
import '../../../../domain/usecases/ask_question_use_case.dart';
import '../../../../domain/values/answer_style.dart';
import '../state/ask_question_state.dart';

class AskQuestionViewModel extends ChangeNotifier {
  final AskQuestionUseCase askQuestionUseCase;

  AskQuestionState state = const AskQuestionState();

  AskQuestionViewModel({
    required this.askQuestionUseCase,
  });

  void updateQuestion(String value) {
    if (value.length > 200) return;

    state = state.copyWith(question: value);
    notifyListeners();
  }

  void updateStyle(AnswerStyle style) {
    state = state.copyWith(style: style);
    notifyListeners();
  }

  Future<QuestionRecord?> submit() async {
    if (state.question.trim().isEmpty) return null;

    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final record = await askQuestionUseCase(
        question: state.question,
        style: state.style,
      );

      state = state.copyWith(isLoading: false);
      notifyListeners();

      return record;
    } catch (e) {
      state = state.copyWith(isLoading: false);
      notifyListeners();
      return null;
    }
  }
}