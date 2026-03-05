import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/ask_question_use_case.dart';
import 'package:eyelevel_kid/ui/question/ask/view_models/ask_question_viewmodel.dart';

AskQuestionViewModel createAskQuestionViewModel() {
  return AskQuestionViewModel(
    askQuestionUseCase: serviceLocator<AskQuestionUseCase>(),
  );
}
