import 'package:eyelevel_kid/domain/usecases/question/delete_question_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/question/observe_all_questions_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/question/toggle_bookmark_use_case.dart';
import 'package:eyelevel_kid/ui/history/view_models/history_viewmodel.dart';

import '../../core/di/service_locator.dart';
import '../../domain/usecases/question/get_question_page_use_case.dart';

HistoryViewModel createHistoryViewModel() {
  return HistoryViewModel(
    observeAllQuestionsUseCase: serviceLocator<ObserveAllQuestionsUseCase>(),
    getQuestionPageUseCase: serviceLocator<GetQuestionPageUseCase>(),
    toggleBookmarkUseCase: serviceLocator<ToggleBookmarkUseCase>(),
    deleteQuestionUseCase: serviceLocator<DeleteQuestionUseCase>(),
  );
}
