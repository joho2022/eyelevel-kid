import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/get_calendar_summary_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/get_question_page_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/observe_recent_questions_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/toggle_bookmark_usecase.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';

import '../../domain/usecases/get_questions_by_date_use_case.dart';

HomeViewModel createHomeViewModel() {
  return HomeViewModel(
      getQuestionPage: serviceLocator<GetQuestionPageUseCase>(),
      getCalendarSummary: serviceLocator<GetCalendarSummaryUseCase>(),
      getQuestionsByDate: serviceLocator<GetQuestionsByDateUseCase>(),
      observeRecentQuestions: serviceLocator<ObserveRecentQuestionsUseCase>(),
      toggleBookmarkUseCase: serviceLocator<ToggleBookmarkUseCase>()
  );
}