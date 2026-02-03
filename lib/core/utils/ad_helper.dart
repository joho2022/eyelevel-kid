import 'dart:io';
import 'package:flutter/foundation.dart';

class AdHelper {
  AdHelper._();

  static String get bannerAdUnitId {
    if (!kReleaseMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/9214589741';
      }
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      }
      return _unsupportedPlatform();
    }

    if (Platform.isAndroid) {
      return 'ca-app-pub-6779090242718409/2918825575';
    }
    if (Platform.isIOS) {
      return 'ca-app-pub-6779090242718409/2132756895';
    }

    return _unsupportedPlatform();
  }

  static Never _unsupportedPlatform() {
    throw UnsupportedError('AdMob banner is not supported on this platform');
  }
}