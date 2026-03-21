import 'dart:io';

import '../../repositories/user_repository.dart';

class UploadProfileImageUseCase {
  final UserRepository repository;

  UploadProfileImageUseCase(this.repository);

  Future<void> call(File file) async {
    await repository.uploadProfileImage(file);
  }
}