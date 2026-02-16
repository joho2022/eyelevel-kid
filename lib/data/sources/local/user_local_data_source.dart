import '../../../domain/entities/user.dart';
import '../../../domain/values/answer_style.dart';

class UserLocalDataSource {
  User _user = const User(
    id: 'local-user',
    nickname: '카이',
    profileImagePath: null,
    answerStyle: AnswerStyle.story,
  );

  User getUser() => _user;

  void saveUser(User user) {
    _user = user;
  }

  void updateNickname(String nickname) {
    _user = _user.copyWith(nickname: nickname);
  }

  void updateAnswerStyle(AnswerStyle style) {
    _user = _user.copyWith(answerStyle: style);
  }

  void updateProfileImage(String? path) {
    _user = _user.copyWith(profileImagePath: path);
  }
}