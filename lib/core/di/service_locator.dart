import 'package:eyelevel_kid/data/sources/remote/user_remote_data_source.dart';
import 'package:eyelevel_kid/domain/usecases/auth/withdraw_usecase.dart';
import 'package:eyelevel_kid/domain/usecases/question/get_question_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/fetch_user_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/observe_user_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/upload_profile_image_Use_Case.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../../core/network/auth_interceptor.dart';
import '../../core/network/refresh_interceptor.dart';

import '../../data/sources/external/image_upload_service.dart';
import '../../data/sources/local/question_local_data_source.dart';
import '../../data/sources/local/token_local_datasource.dart';
import '../../data/sources/local/user_local_data_source.dart';

import '../../data/sources/remote/auth_remote_data_source.dart';

import 'package:eyelevel_kid/data/sources/external/google_auth_service.dart';
import '../../data/sources/external/apple_auth_service.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/calendar_repository_impl.dart';
import '../../data/repositories/question_repository_impl.dart';
import '../../data/repositories/token_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';

import '../../data/sources/remote/question_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/repositories/token_repository.dart';
import '../../domain/repositories/user_repository.dart';

import '../../domain/usecases/auth/refresh_token_usecase.dart';
import '../../domain/usecases/auth/social_login_usecase.dart';
import '../../domain/usecases/question/ask_question_use_case.dart';
import '../../domain/usecases/question/delete_question_use_case.dart';
import '../../domain/usecases/calendar/get_calendar_summary_use_case.dart';
import '../../domain/usecases/question/get_question_page_use_case.dart';
import '../../domain/usecases/calendar/get_questions_by_date_use_case.dart';
import '../../domain/usecases/user/get_user_use_case.dart';
import '../../domain/usecases/auth/logout_usecase.dart';
import '../../domain/usecases/question/observe_all_questions_use_case.dart';
import '../../domain/usecases/user/update_nickname_use_case.dart';
import '../../domain/usecases/user/update_profile_use_case.dart';
import '../../domain/usecases/question/toggle_bookmark_usecase.dart';
import '../../domain/usecases/user/update_answer_style_use_case.dart';
import '../auth/app_auth_viewmodel.dart';
import '../image/image_compress_service.dart';
import '../image/image_picker_service.dart';

final serviceLocator = GetIt.instance;

void setupDependencies() {
  // MARK: - TokenLocalDataSource
  serviceLocator.registerLazySingleton(() => TokenLocalDataSource());

  // MARK: - Repository
  serviceLocator.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(serviceLocator<TokenLocalDataSource>()),
  );

  // MARK: - UseCase (Auth)
  serviceLocator.registerLazySingleton(
    () => LogoutUseCase(serviceLocator<AuthRepository>(), serviceLocator<TokenRepository>()),
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

  serviceLocator.registerLazySingleton(
        () => WithdrawUseCase(serviceLocator<AuthRepository>(), serviceLocator<TokenRepository>())
  );


  // MARK: - Dio
  serviceLocator.registerLazySingleton<Dio>(
    () => DioClient.create(),
    instanceName: 'retryDio',
  );

  serviceLocator.registerLazySingleton<Dio>(() {
    final dio = DioClient.create();
    final retryDio = serviceLocator<Dio>(instanceName: 'retryDio');

    dio.interceptors.add(AuthInterceptor(serviceLocator<TokenRepository>()));

    dio.interceptors.add(
      RefreshInterceptor(
        retryDio: retryDio,
        refreshUseCase: serviceLocator<RefreshTokenUseCase>(),
        logoutUseCase: serviceLocator<LogoutUseCase>(),
      ),
    );

    return dio;
  }, instanceName: 'mainDio');

  // MARK: - Remote DataSource
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(serviceLocator<Dio>(instanceName: 'retryDio')),
  );

  serviceLocator.registerLazySingleton(
    () => UserRemoteDataSource(serviceLocator<Dio>(instanceName: 'mainDio')),
  );

  serviceLocator.registerLazySingleton(
    () =>
        QuestionRemoteDataSource(serviceLocator<Dio>(instanceName: 'mainDio')),
  );

  // MARK: - Local DataSource
  serviceLocator.registerLazySingleton(() => QuestionLocalDataSource());
  serviceLocator.registerLazySingleton(() => UserLocalDataSource());

  // MARK: - external DataSource
  serviceLocator.registerLazySingleton(() => GoogleAuthService());
  serviceLocator.registerLazySingleton(() => AppleAuthService());
  serviceLocator.registerLazySingleton(
    () => ImageUploadService(serviceLocator<Dio>(instanceName: 'mainDio')),
  );

  // MARK: - Core Service
  serviceLocator.registerLazySingleton(
        () => ImagePickerService(),
  );
  serviceLocator.registerLazySingleton(
        () => ImageCompressService(),
  );

  // MARK: - Repository
  serviceLocator.registerLazySingleton<CalendarRepository>(
    () => CalendarRepositoryImpl(serviceLocator<QuestionRemoteDataSource>()),
  );

  serviceLocator.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(
      remote: serviceLocator<QuestionRemoteDataSource>(),
      local: serviceLocator<QuestionLocalDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remote: serviceLocator<UserRemoteDataSource>(),
      local: serviceLocator<UserLocalDataSource>(),
      imageUpload: serviceLocator<ImageUploadService>(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator<AuthRemoteDataSource>()),
  );

  // MARK: - UseCase (User)
  serviceLocator.registerLazySingleton(
        () => FetchUserUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetUserUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => ObserveUserUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => UpdateAnswerStyleUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => UpdateNicknameUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => UpdateProfileUseCase(serviceLocator<UserRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => UploadProfileImageUseCase(serviceLocator<UserRepository>()),
  );

  // MARK: - UseCase (Calendar)
  serviceLocator.registerLazySingleton(
    () => GetCalendarSummaryUseCase(serviceLocator<CalendarRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => GetQuestionsByDateUseCase(serviceLocator<CalendarRepository>()),
  );

  // MARK: - UseCase (Question)
  serviceLocator.registerLazySingleton(
    () => AskQuestionUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => DeleteQuestionUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => GetQuestionPageUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => ObserveAllQuestionsUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => ToggleBookmarkUseCase(serviceLocator<QuestionRepository>()),
  );

  serviceLocator.registerLazySingleton(
        () => GetQuestionUseCase(serviceLocator<QuestionRepository>()),
  );

  // MARK: - ViewModel (전역 상태)
  serviceLocator.registerLazySingleton<AppAuthViewModel>(
    () => AppAuthViewModel(serviceLocator<TokenRepository>()),
  );
}
