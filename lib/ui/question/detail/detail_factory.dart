import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/get_question_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/toggle_bookmark_usecase.dart';
import 'package:eyelevel_kid/ui/question/detail/view_models/detail_viewmodel.dart';

DetailViewModel createDetailViewModel(int questionId) {
  return DetailViewModel(
    questionId: questionId,
    getQuestionUseCase: serviceLocator<GetQuestionUseCase>(),
    toggleBookmarkUseCase: serviceLocator<ToggleBookmarkUseCase>(),
  );
}
