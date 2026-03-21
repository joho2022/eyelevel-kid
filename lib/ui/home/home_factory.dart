import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/calendar/get_calendar_summary_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/question/observe_all_questions_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/question/toggle_bookmark_use_case.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';

import '../../domain/usecases/calendar/get_questions_by_date_use_case.dart';
import '../../domain/usecases/question/get_question_page_use_case.dart';

HomeViewModel createHomeViewModel() {
  return HomeViewModel(
    getCalendarSummaryUseCase: serviceLocator<GetCalendarSummaryUseCase>(),
    getQuestionsByDateUseCase: serviceLocator<GetQuestionsByDateUseCase>(),
    observeQuestionsUseCase: serviceLocator<ObserveAllQuestionsUseCase>(),
    toggleBookmarkUseCase: serviceLocator<ToggleBookmarkUseCase>(),
    getQuestionPageUseCase: serviceLocator<GetQuestionPageUseCase>(),
  );
}
