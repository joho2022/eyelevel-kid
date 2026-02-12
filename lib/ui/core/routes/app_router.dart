import 'package:eyelevel_kid/app_providers.dart';
import 'package:eyelevel_kid/ui/core/routes/route_paths.dart';
import 'package:eyelevel_kid/ui/my/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../history/history_screen.dart';
import '../../home/home_screen.dart';
import '../../question/detail/detail_screen.dart';
import 'main_tab.dart';
import 'main_tab_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: MainTab.home.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return  MainTabScaffold(
            navigationShell: navigationShell,
          );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MainTab.home.path,
              builder: (_, __) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MainTab.history.path,
              builder: (_, __) => const HistoryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MainTab.my.path,
              builder: (_, __) => const MyScreen(),
            ),
          ],
        )
      ],
    ),

    GoRoute(
      path: RoutePaths.questionDetail,
      builder: (context, state) {
        final idString = state.pathParameters['id'];
        final id = int.tryParse(idString ?? '');

        if (id == null) {
          return const Scaffold(
            body: Center(
              child: Text('잘못된 접근입니다'),
            ),
          );
        }

        return DetailScreen(questionId: id);
      },
    ),
  ],
);