import 'package:eyelevel_kid/data/sources/mock/mock_user_remote_data_source.dart';
import 'package:eyelevel_kid/domain/usecases/ask_question_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/save_nickname_use_case.dart';

import 'data/repositories/calendar_repository_impl.dart';
import 'data/repositories/question_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'data/sources/local/question_local_data_source.dart';
import 'data/sources/local/user_local_data_source.dart';
import 'data/sources/mock/mock_calendar_remote_data_source.dart';
import 'data/sources/mock/mock_question_remote_data_source.dart';
import 'domain/repositories/calendar_repository.dart';
import 'domain/repositories/question_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/delete_question_use_case.dart';
import 'domain/usecases/get_all_questions_snapshot_use_case.dart';
import 'domain/usecases/get_calendar_summary_use_case.dart';
import 'domain/usecases/get_question_page_use_case.dart';
import 'domain/usecases/get_question_use_case.dart';
import 'domain/usecases/get_questions_by_date_use_case.dart';
import 'domain/usecases/observe_all_questions_use_case.dart';
import 'domain/usecases/observe_recent_questions_use_case.dart';
import 'domain/usecases/toggle_bookmark_usecase.dart';

class DIContainer {
  DIContainer._();

  // ===== DataSource =====
  static final MockCalendarRemoteDataSource calendarRemote =
  MockCalendarRemoteDataSource();

  static final MockQuestionRemoteDataSource questionRemote =
  MockQuestionRemoteDataSource();

  static final MockUserRemoteDataSource userRemote =
  MockUserRemoteDataSource();

  static final QuestionLocalDataSource questionLocal =
  QuestionLocalDataSource();

  static final UserLocalDataSource userLocal =
  UserLocalDataSource();

  // ===== Repository =====
  static final CalendarRepository calendarRepository =
  CalendarRepositoryImpl(calendarRemote);

  static final QuestionRepository questionRepository =
  QuestionRepositoryImpl(
    remote: questionRemote,
    local: questionLocal,
  );

  static final UserRepository userRepository =
  UserRepositoryImpl(
    remote: userRemote,
    local: userLocal,
  );


  // ===== UseCases =====
  static final GetQuestionPageUseCase getQuestionPage =
  GetQuestionPageUseCase(questionRepository);

  static final ObserveRecentQuestionsUseCase observeRecentQuestions =
  ObserveRecentQuestionsUseCase(questionRepository);

  static final ObserveAllQuestionsUseCase observeAllQuestions =
  ObserveAllQuestionsUseCase(questionRepository);

  static final ToggleBookmarkUseCase toggleBookmark =
  ToggleBookmarkUseCase(questionRepository);

  static final DeleteQuestionUseCase deleteQuestion =
  DeleteQuestionUseCase(questionRepository);

  static final GetCalendarSummaryUseCase getCalendarSummary =
  GetCalendarSummaryUseCase(calendarRepository);

  static final GetQuestionsByDateUseCase getQuestionsByDate =
  GetQuestionsByDateUseCase(calendarRepository);

  static final GetAllQuestionsSnapshotUseCase getAllQuestionsSnapshot =
  GetAllQuestionsSnapshotUseCase(questionRepository);

  static final GetQuestionUseCase getQuestionDetail =
  GetQuestionUseCase(questionRepository);

  static final AskQuestionUseCase askQuestion =
  AskQuestionUseCase(questionRepository);

  static final SaveNicknameUseCase saveNickname =
  SaveNicknameUseCase(userRepository);
}