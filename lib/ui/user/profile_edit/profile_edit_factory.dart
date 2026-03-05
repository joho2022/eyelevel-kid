import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/domain/usecases/get_user_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/save_profile_use_case.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/view_models/profile_edit_viewmodel.dart';

ProfileEditViewModel createProfileEditViewModel() {
  return ProfileEditViewModel(
    saveProfileUseCase: serviceLocator<SaveProfileUseCase>(),
    getUserUseCase: serviceLocator<GetUserUseCase>(),
  );
}
