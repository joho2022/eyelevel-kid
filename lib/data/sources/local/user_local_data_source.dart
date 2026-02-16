import 'dart:async';

import '../../../domain/entities/user.dart';
import '../../../domain/values/answer_style.dart';

class UserLocalDataSource {
  User _user = const User(
    id: 'local-user',
    nickname: '카이',
    profileImagePath: null,
    answerStyle: AnswerStyle.story,
  );

  final _controller = StreamController<User>.broadcast();

  User getUser() => _user;

  Stream<User> observeUser() => _controller.stream;

  void saveUser(User user) {
    _user = user;
    _controller.add(_user);
  }
}