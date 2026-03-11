import 'package:eyelevel_kid/data/sources/external/apple_auth_service.dart';
import 'package:eyelevel_kid/data/sources/external/google_auth_service.dart';
import 'package:eyelevel_kid/ui/auth/view_models/login_viewmodel.dart';

import '../../core/auth/app_auth_viewmodel.dart';
import '../../core/di/service_locator.dart';
import '../../domain/usecases/social_login_usecase.dart';

LoginViewModel createLoginViewModel() {
  return LoginViewModel(
    googleAuthDataSource: serviceLocator<GoogleAuthService>(),
    appleAuthDataSource: serviceLocator<AppleAuthService>(),
    socialLoginUseCase: serviceLocator<SocialLoginUseCase>(),
    appAuthViewModel: serviceLocator<AppAuthViewModel>(),
  );
}
