import 'package:eyelevel_kid/data/sources/remote/user_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../../core/network/auth_interceptor.dart';
import '../../core/network/refresh_interceptor.dart';

import '../../data/sources/local/question_local_data_source.dart';
import '../../data/sources/local/token_local_datasource.dart';
import '../../data/sources/local/user_local_data_source.dart';

import '../../data/sources/mock/mock_calendar_remote_data_source.dart';
import '../../data/sources/mock/mock_question_remote_data_source.dart';
import '../../data/sources/remote/auth_remote_data_source.dart';

import 'package:eyelevel_kid/data/sources/external/google_auth_data_source.dart';
import '../../data/sources/external/apple_auth_data_source.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/calendar_repository_impl.dart';
import '../../data/repositories/question_repository_impl.dart';
import '../../data/repositories/token_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/repositories/token_repository.dart';
import '../../domain/repositories/user_repository.dart';

import '../../domain/usecases/ask_question_use_case.dart';
import '../../domain/usecases/delete_question_use_case.dart';
import '../../domain/usecases/get_all_questions_snapshot_use_case.dart';
import '../../domain/usecases/get_calendar_summary_use_case.dart';
import '../../domain/usecases/get_question_page_use_case.dart';
import '../../domain/usecases/get_question_use_case.dart';
import '../../domain/usecases/get_questions_by_date_use_case.dart';
import '../../domain/usecases/get_user_use_case.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/observe_all_questions_use_case.dart';
import '../../domain/usecases/observe_recent_questions_use_case.dart';
import '../../domain/usecases/refresh_token_usecase.dart';
import '../../domain/usecases/user/save_nickname_use_case.dart';
import '../../domain/usecases/user/save_profile_use_case.dart';
import '../../domain/usecases/social_login_usecase.dart';
import '../../domain/usecases/toggle_bookmark_usecase.dart';
import '../../domain/usecases/user/update_answer_style_use_case.dart';
import '../auth/app_auth_viewmodel.dart';

final serviceLocator = GetIt.instance;

void setupDependencies() {

  // MARK: - TokenLocalDataSource
  serviceLocator.registerLazySingleton(() => TokenLocalDataSource());

  // MARK: - Repository
  serviceLocator.registerLazySingleton<TokenRepository>(
        () => TokenRepositoryImpl(serviceLocator<TokenLocalDataSource>()),
  );

  // MARK: - UseCase (refresh / logout 먼저 필요)
  serviceLocator.registerLazySingleton(
        () => LogoutUseCase(serviceLocator<TokenRepository>()),
  );

  // MARK: - Dio
  serviceLocator.registerLazySingleton<Dio>(
        () => DioClient.create(),
    instanceName: 'retryDio',
  );

  serviceLocator.registerLazySingleton<Dio>(
        () {
      final dio = DioClient.create();
      final retryDio = serviceLocator<Dio>(instanceName: 'retryDio');

      dio.interceptors.add(
        AuthInterceptor(serviceLocator<TokenRepository>()),
      );

      dio.interceptors.add(
        RefreshInterceptor(
          retryDio: retryDio,
          refreshUseCase: serviceLocator<RefreshTokenUseCase>(),
          logoutUseCase: serviceLocator<LogoutUseCase>(),
        ),
      );

      return dio;
    },
    instanceName: 'mainDio',
  );

  // MARK: - Remote DataSource
  serviceLocator.registerLazySingleton(() => MockCalendarRemoteDataSource());
  serviceLocator.registerLazySingleton(() => MockQuestionRemoteDataSource());

  serviceLocator.registerLazySingleton(
        () => UserRemoteDataSource(
      serviceLocator<Dio>(instanceName: 'mainDio'),
    ),
  );

  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(
      serviceLocator<Dio>(instanceName: 'retryDio'),
    ),
  );

  // MARK: - Local DataSource
  serviceLocator.registerLazySingleton(() => QuestionLocalDataSource());
  serviceLocator.registerLazySingleton(() => UserLocalDataSource());

  // MARK: - external DataSource
  serviceLocator.registerLazySingleton(() => GoogleAuthDataSource());
  serviceLocator.registerLazySingleton(() => AppleAuthDataSource());

  // MARK: - Repository
  serviceLocator.registerLazySingleton<CalendarRepository>(
        () => CalendarRepositoryImpl(
      serviceLocator<MockCalendarRemoteDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<QuestionRepository>(
        () => QuestionRepositoryImpl(
      remote: serviceLocator<MockQuestionRemoteDataSource>(),
      local: serviceLocator<QuestionLocalDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
      remote: serviceLocator<UserRemoteDataSource>(),
      local: serviceLocator<UserLocalDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator<AuthRemoteDataSource>()),
  );

  // MARK: - UseCase
  serviceLocator.registerLazySingleton(
        () => GetQuestionPageUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => ObserveRecentQuestionsUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => ObserveAllQuestionsUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => ToggleBookmarkUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => DeleteQuestionUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetCalendarSummaryUseCase(serviceLocator<CalendarRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetQuestionsByDateUseCase(serviceLocator<CalendarRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetAllQuestionsSnapshotUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetQuestionUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => AskQuestionUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => SaveNicknameUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetUserUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => SaveProfileUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => UpdateAnswerStyleUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => SocialLoginUseCase(serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => RefreshTokenUseCase(
      serviceLocator<AuthRepository>(),
      serviceLocator<TokenRepository>(),
    ),
  );

  // MARK: - ViewModel (전역 상태)
  serviceLocator.registerLazySingleton<AppAuthViewModel>(
        () => AppAuthViewModel(serviceLocator<TokenRepository>()),
  );
}