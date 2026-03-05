import 'package:eyelevel_kid/domain/usecases/delete_question_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/get_all_questions_snapshot_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/observe_all_questions_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/toggle_bookmark_usecase.dart';
import 'package:eyelevel_kid/ui/history/view_models/history_viewmodel.dart';

import '../../core/di/service_locator.dart';

HistoryViewModel createHistoryViewModel() {
  return HistoryViewModel(
    observeAllQuestionsUseCase: serviceLocator<ObserveAllQuestionsUseCase>(),
    toggleBookmarkUseCase: serviceLocator<ToggleBookmarkUseCase>(),
    deleteQuestionUseCase: serviceLocator<DeleteQuestionUseCase>(),
    getAllQuestionsSnapshotUseCase: serviceLocator<GetAllQuestionsSnapshotUseCase>(),
  );
}
