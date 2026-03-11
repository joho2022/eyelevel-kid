import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/question/ask_question_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/get_user_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/update_answer_style_use_case.dart';
import 'package:eyelevel_kid/ui/question/ask/view_models/ask_question_viewmodel.dart';

AskQuestionViewModel createAskQuestionViewModel() {
  return AskQuestionViewModel(
    askQuestionUseCase: serviceLocator<AskQuestionUseCase>(),
    getUserUseCase: serviceLocator<GetUserUseCase>(),
    updateAnswerStyleUseCase: serviceLocator<UpdateAnswerStyleUseCase>(),
  );
}
