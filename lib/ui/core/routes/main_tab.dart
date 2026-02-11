import 'package:eyelevel_kid/ui/core/routes/route_paths.dart';
import 'package:flutter/material.dart';

enum MainTab {
  home,
  history,
  my;

  String get label {
    switch (this) {
      case MainTab.home:
        return '홈';
      case MainTab.history:
        return '기록';
      case MainTab.my:
        return '내정보';
    }
  }

  IconData get icon {
    switch (this) {
      case MainTab.home:
        return Icons.home;
      case MainTab.history:
        return Icons.history;
      case MainTab.my:
        return Icons.person;
    }
  }

  String get path {
    switch (this) {
      case MainTab.home:
        return RoutePaths.home;
      case MainTab.history:
        return RoutePaths.history;
      case MainTab.my:
        return RoutePaths.my;
    }
  }
}