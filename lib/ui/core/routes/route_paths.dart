class RoutePaths {
  static const String splash = '/';

  static const String login = '/login';
  static const String nicknameSetup = 'nickname-setup';

  static const String home = '/home';
  static const String history = '/history';
  static const String my = '/my';

  static const String profileEdit = '/profile-edit';
  static const String questionDetail = '/question/:id';
  static String questionDetailPath(int id) => '/question/$id';

  static const String askQuestion = '/ask';
}