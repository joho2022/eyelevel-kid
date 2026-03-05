import 'package:eyelevel_kid/ui/user/nickname_setup/view_models/nickname_setup_viewmodel.dart';

import '../../../core/auth/app_auth_viewmodel.dart';
import '../../../core/di/service_locator.dart';
import '../../../domain/usecases/user/save_nickname_use_case.dart';

NicknameSetupViewModel createNicknameSetupViewModel() {
  return NicknameSetupViewModel(
    appAuthViewModel: serviceLocator<AppAuthViewModel>(),
    saveNicknameUseCase: serviceLocator<SaveNicknameUseCase>(),
  );
}
