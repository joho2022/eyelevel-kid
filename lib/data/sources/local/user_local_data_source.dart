import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/values/answer_style.dart';

class UserLocalDataSource {
  static const _userCacheKey = 'USER_CACHE';

  final SharedPreferences sharedPreferences;

  User _user = const User(
    id: 0,
    nickname: '',
    profileImage: null,
    answerStyle: AnswerStyle.story,
  );

  final _controller = StreamController<User>.broadcast();

  UserLocalDataSource(this.sharedPreferences) {
    _user = _restoreUser();
  }

  User getUser() => _user;

  Stream<User> observeUser() => _controller.stream;

  void saveUser(User user) {
    _user = user;
    _persistUser(user);
    _controller.add(user);
  }

  void updateAnswerStyle(AnswerStyle style) {
    _user = _user.copyWith(answerStyle: style);
    _persistUser(_user);
    _controller.add(_user);
  }

  User _restoreUser() {
    final raw = sharedPreferences.getString(_userCacheKey);

    if (raw == null || raw.isEmpty) {
      return _user;
    }

    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;

      return User(
        id: json['id'] as int? ?? 0,
        nickname: json['nickname'] as String? ?? '',
        profileImage: json['profileImage'] as String?,
        answerStyle: AnswerStyle.values.firstWhere(
          (style) => style.name == json['answerStyle'],
          orElse: () => AnswerStyle.story,
        ),
      );
    } catch (_) {
      sharedPreferences.remove(_userCacheKey);
      return _user;
    }
  }

  void _persistUser(User user) {
    final json = <String, dynamic>{
      'id': user.id,
      'nickname': user.nickname,
      'profileImage': user.profileImage,
      'answerStyle': user.answerStyle.name,
    };

    sharedPreferences.setString(_userCacheKey, jsonEncode(json));
  }
}
