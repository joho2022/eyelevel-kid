import 'dart:io';

import '../../repositories/user_repository.dart';

class UploadProfileImageUseCase {
  final UserRepository repository;

  UploadProfileImageUseCase(this.repository);

  Future<String> call(File file) async {
    return repository.uploadProfileImage(file);
  }
}