import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../domain/entities/question_record.dart';
import '../../../../domain/usecases/question/ask_question_use_case.dart';
import '../../../../domain/usecases/user/get_user_use_case.dart';
import '../../../../domain/usecases/user/update_answer_style_use_case.dart';
import '../../../../domain/values/answer_style.dart';
import '../state/ask_question_state.dart';

final askQuestionNotifierProvider =
    NotifierProvider.autoDispose<AskQuestionNotifier, AskQuestionState>(
      AskQuestionNotifier.new,
    );

class AskQuestionNotifier extends Notifier<AskQuestionState> {
  late final AskQuestionUseCase _askQuestionUseCase;
  late final GetUserUseCase _getUserUseCase;
  late final UpdateAnswerStyleUseCase _updateAnswerStyleUseCase;

  // MARK: - Build
  @override
  AskQuestionState build() {
    _askQuestionUseCase = serviceLocator<AskQuestionUseCase>();
    _getUserUseCase = serviceLocator<GetUserUseCase>();
    _updateAnswerStyleUseCase = serviceLocator<UpdateAnswerStyleUseCase>();

    final user = _getUserUseCase();

    return AskQuestionState(style: user.answerStyle);
  }

  // MARK: - 스타일 변경
  void updateStyle(AnswerStyle style) {
    state = state.copyWith(style: style);
    _updateAnswerStyleUseCase(style);
  }

  // MARK: - 질문 입력
  void updateQuestion(String value) {
    if (value.length > 200) return;

    final cleaned = value.trim();

    state = state.copyWith(question: value, canSubmit: cleaned.isNotEmpty);
  }

  // MARK: - 질문 전송
  Future<QuestionRecord?> submit() async {
    if (!state.canSubmit || state.isLoading) return null;

    debugPrint('==== submit 시작 ====');
    state = state.copyWith(isLoading: true);

    try {
      final record = await _askQuestionUseCase(
        question: state.question.trim(),
        style: state.style,
      );

      debugPrint('==== 서버 응답 ====');
      debugPrint('$record');

      state = state.copyWith(isLoading: false);
      return record;
    } catch (e) {
      debugPrint('==== submit error ====');
      debugPrint('$e');

      if (e is DioException) {
        debugPrint('==== 서버 응답 ====');
        debugPrint('${e.response?.data}');
      }

      state = state.copyWith(isLoading: false);
      return null;
    }
  }
}
