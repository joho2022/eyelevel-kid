import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/user/fetch_user_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/refresh_profile_image_url_use_case.dart';
import 'package:eyelevel_kid/ui/user/my/view_models/my_viewmodel.dart';

import '../../../domain/usecases/auth/logout_usecase.dart';
import '../../../domain/usecases/auth/withdraw_usecase.dart';
import '../../../domain/usecases/user/observe_user_use_case.dart';
import '../../../domain/usecases/user/update_answer_style_use_case.dart';

MyViewModel createMyViewModel() {
  return MyViewModel(
    observeUserUseCase: serviceLocator<ObserveUserUseCase>(),
    fetchUserUseCase: serviceLocator<FetchUserUseCase>(),
    refreshProfileImageUrlUseCase: serviceLocator<RefreshProfileImageUrlUseCase>(),
    updateAnswerStyleUseCase: serviceLocator<UpdateAnswerStyleUseCase>(),
    logoutUseCase: serviceLocator<LogoutUseCase>(),
    withdrawUseCase: serviceLocator<WithdrawUseCase>(),
  );
}
