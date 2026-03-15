import '../values/answer_style.dart';

class User {
  final int id;
  final String nickname;
  final String? profileImage;
  final AnswerStyle answerStyle;

  const User({
    required this.id,
    required this.nickname,
    this.profileImage,
    required this.answerStyle,
  });

  User copyWith({
    int? id,
    String? nickname,
    String? profileImage,
    AnswerStyle? answerStyle,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      profileImage: profileImage ?? this.profileImage,
      answerStyle: answerStyle ?? this.answerStyle,
    );
  }
}