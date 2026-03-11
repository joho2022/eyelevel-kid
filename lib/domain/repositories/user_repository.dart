import 'dart:io';

import '../entities/user.dart';
import '../values/answer_style.dart';

abstract class UserRepository {
  User getUser();

  Stream<User> observeUser();

  Future<void> fetchUser();

  Future<void> updateNickname(String nickname);

  Future<void> updateProfile({String? nickname, String? profileImagePath});

  Future<void> updateAnswerStyle(AnswerStyle style);

  Future<String> uploadProfileImage(File file);
}
