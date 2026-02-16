import '../values/answer_style.dart';

class User {
  final String id;
  final String nickname;
  final String? profileImagePath;
  final AnswerStyle answerStyle;

  const User({
    required this.id,
    required this.nickname,
    this.profileImagePath,
    required this.answerStyle,
  });

  User copyWith({
    String? id,
    String? nickname,
    String? profileImagePath,
    AnswerStyle? answerStyle,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      answerStyle: answerStyle ?? this.answerStyle,
    );
  }
}