import 'package:eyelevel_kid/core/di/service_locator.dart';
import 'package:eyelevel_kid/core/image/image_compress_service.dart';
import 'package:eyelevel_kid/core/image/image_picker_service.dart';
import 'package:eyelevel_kid/domain/usecases/user/get_user_use_case.dart';
import 'package:eyelevel_kid/domain/usecases/user/update_profile_use_case.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/view_models/profile_edit_viewmodel.dart';

import '../../../domain/usecases/user/upload_profile_image_use_case.dart';

ProfileEditViewModel createProfileEditViewModel() {
  return ProfileEditViewModel(
      updateProfileUseCase: serviceLocator<UpdateProfileUseCase>(),
      getUserUseCase: serviceLocator<GetUserUseCase>(),
      uploadProfileImageUseCase: serviceLocator<UploadProfileImageUseCase>(),
      imagePickerService: serviceLocator<ImagePickerService>(),
      imageCompressService: serviceLocator<ImageCompressService>()
  );
}
