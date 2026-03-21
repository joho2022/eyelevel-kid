import '../values/answer_style.dart';

class User {
  final int id;
  final String nickname;
  final String? profileImageUrl;
  final AnswerStyle answerStyle;

  const User({
    required this.id,
    required this.nickname,
    this.profileImageUrl,
    required this.answerStyle,
  });

  User copyWith({
    int? id,
    String? nickname,
    String? profileImageUrl,
    AnswerStyle? answerStyle,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      answerStyle: answerStyle ?? this.answerStyle,
    );
  }
}