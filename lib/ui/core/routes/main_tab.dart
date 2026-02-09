import 'package:eyelevel_kid/ui/core/routes/route_paths.dart';
import 'package:flutter/material.dart';

enum MainTab {
  home,
  history;

  String get label {
    switch (this) {
      case MainTab.home:
        return '홈';
      case MainTab.history:
        return '기록';
    }
  }

  IconData get icon {
    switch (this) {
      case MainTab.home:
        return Icons.home;
      case MainTab.history:
        return Icons.history;
    }
  }

  String get path {
    switch (this) {
      case MainTab.home:
        return RoutePaths.home;
      case MainTab.history:
        return RoutePaths.history;
    }
  }
}