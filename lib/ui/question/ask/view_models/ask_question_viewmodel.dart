import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/entities/question_record.dart';
import '../../../../domain/usecases/question/ask_question_use_case.dart';
import '../../../../domain/usecases/user/get_user_use_case.dart';
import '../../../../domain/usecases/user/update_answer_style_use_case.dart';
import '../../../../domain/values/answer_style.dart';
import '../state/ask_question_state.dart';

class AskQuestionViewModel extends ChangeNotifier {
  final AskQuestionUseCase askQuestionUseCase;
  final GetUserUseCase getUserUseCase;
  final UpdateAnswerStyleUseCase updateAnswerStyleUseCase;

  AskQuestionState state = const AskQuestionState();

  AskQuestionViewModel({
    required this.askQuestionUseCase,
    required this.getUserUseCase,
    required this.updateAnswerStyleUseCase,
  }) {
    _init();
  }

  Future<void> _init() async {
    final user = await getUserUseCase();

    state = state.copyWith(style: user.answerStyle);
    notifyListeners();
  }

  void updateStyle(AnswerStyle style) {
    state = state.copyWith(style: style);
    notifyListeners();

    updateAnswerStyleUseCase(style);
  }

  void updateQuestion(String value) {
    if (value.length > 200) return;

    final cleaned = value.trim();

    state = state.copyWith(
      question: value,
      canSubmit: cleaned.isNotEmpty,
    );

    notifyListeners();
  }

  Future<QuestionRecord?> submit() async {
    if (!state.canSubmit || state.isLoading) return null;

    print("==== submit 시작 ====");

    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final record = await askQuestionUseCase(
        question: state.question.trim(),
        style: state.style,
      );

      print("==== 서버 응답 ====");
      print(record);

      state = state.copyWith(isLoading: false);
      notifyListeners();

      return record;
    } catch (e) {
      print("==== submit error ====");
      print(e);

      if (e is DioException) {
        print("==== 서버 응답 ====");
        print(e.response?.data);
      }


      state = state.copyWith(isLoading: false);
      notifyListeners();

      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}