import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/version_comparer.dart';
import '../../../domain/entities/app_config.dart';
import '../../../domain/usecases/app_config/fetch_app_config_usecase.dart';

enum LaunchPromptType { notice, optionalUpdate, forcedUpdate }

class LaunchPrompt {
  final LaunchPromptType type;
  final String title;
  final String body;
  final bool blocking;
  final String? storageKey;

  const LaunchPrompt({
    required this.type,
    required this.title,
    required this.body,
    required this.blocking,
    this.storageKey,
  });
}

class LaunchGateViewModel extends ChangeNotifier {
  static bool _checkedThisSession = false;

  final FetchAppConfigUseCase fetchAppConfigUseCase;
  final SharedPreferences sharedPreferences;

  final Queue<LaunchPrompt> _promptQueue = Queue<LaunchPrompt>();

  bool _initialized = false;
  bool _isInitializing = false;

  LaunchGateViewModel({
    required this.fetchAppConfigUseCase,
    required this.sharedPreferences,
  });

  LaunchPrompt? get currentPrompt =>
      _promptQueue.isEmpty ? null : _promptQueue.first;

  bool get hasPromptToShow => currentPrompt != null;

  bool get hasCheckedThisSession => _checkedThisSession;

  // MARK: - 주소 다시 입력
  String get storeUrl {
    if (Platform.isIOS) {
      return 'https://apps.apple.com/app/id6741756312';
    }

    return 'https://play.google.com/store/apps/details?id=com.hogeunjo.eyelevel.eyelevel_kid';
  }

  Future<void> initialize() async {
    if (_initialized || _isInitializing || _checkedThisSession) return;

    _isInitializing = true;

    try {
      final appConfig = await fetchAppConfigUseCase();
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      _buildPromptQueue(appConfig: appConfig, currentVersion: currentVersion);

      _initialized = true;
      _checkedThisSession = true;
      notifyListeners();
    } finally {
      _isInitializing = false;
    }
  }

  void dismissCurrentPrompt() {
    if (_promptQueue.isEmpty) return;

    _promptQueue.removeFirst();
    notifyListeners();
  }

  Future<void> dismissNoticeForToday() async {
    final prompt = currentPrompt;

    if (prompt == null || prompt.type != LaunchPromptType.notice) {
      return;
    }

    final storageKey = prompt.storageKey;
    if (storageKey != null) {
      final today = DateTime.now();
      final value =
          '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
      await sharedPreferences.setString(storageKey, value);
    }

    dismissCurrentPrompt();
  }

  void _buildPromptQueue({
    required AppConfig appConfig,
    required String currentVersion,
  }) {
    _promptQueue.clear();

    final needsForcedUpdate = VersionComparer.isLowerThan(
      currentVersion,
      appConfig.minimumVersion,
    );

    if (needsForcedUpdate) {
      _promptQueue.add(
        const LaunchPrompt(
          type: LaunchPromptType.forcedUpdate,
          title: '업데이트가 필요해요',
          body: '안정적인 사용을 위해\n최신 버전으로 업데이트해주세요.',
          blocking: true,
        ),
      );
      return;
    }

    final needsOptionalUpdate = VersionComparer.isLowerThan(
      currentVersion,
      appConfig.latestVersion,
    );

    if (needsOptionalUpdate) {
      _promptQueue.add(
        const LaunchPrompt(
          type: LaunchPromptType.optionalUpdate,
          title: '새 버전이 나왔어요',
          body: '더 좋은 사용 경험을 위해\n앱을 업데이트해보세요.',
          blocking: false,
        ),
      );
    }

    if (appConfig.message.show) {
      final noticeKey = _noticeStorageKey(
        title: appConfig.message.title ?? '',
        body: appConfig.message.body ?? '',
      );

      if (_isDismissedToday(noticeKey)) {
        return;
      }

      _promptQueue.add(
        LaunchPrompt(
          type: LaunchPromptType.notice,
          title: appConfig.message.title ?? '공지',
          body: appConfig.message.body ?? '',
          blocking: appConfig.message.blocking,
          storageKey: noticeKey,
        ),
      );
    }
  }

  bool _isDismissedToday(String key) {
    final saved = sharedPreferences.getString(key);
    if (saved == null || saved.isEmpty) {
      return false;
    }

    final today = DateTime.now();
    final current =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

    return saved == current;
  }

  String _noticeStorageKey({required String title, required String body}) {
    final source = '$title|$body';
    final hash = source.codeUnits.fold<int>(
      17,
      (value, unit) => value * 31 + unit,
    );

    return 'NOTICE_DISMISSED_$hash';
  }
}
