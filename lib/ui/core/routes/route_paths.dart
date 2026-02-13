class RoutePaths {
  static const String home = '/';
  static const String history = '/history';
  static const String my = '/my';
  static const String questionDetail = '/question/:id';
  static String questionDetailPath(int id) => '/question/$id';
  static const String askQuestion = '/ask';
}