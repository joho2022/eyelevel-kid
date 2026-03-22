class AppConfigMessage {
  final bool show;
  final String? title;
  final String? body;
  final bool blocking;

  const AppConfigMessage({
    required this.show,
    required this.title,
    required this.body,
    required this.blocking,
  });
}

class AppConfig {
  final String minimumVersion;
  final String latestVersion;
  final AppConfigMessage message;

  const AppConfig({
    required this.minimumVersion,
    required this.latestVersion,
    required this.message,
  });
}