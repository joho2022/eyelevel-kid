import 'package:eyelevel_kid/app_providers.dart';
import 'package:go_router/go_router.dart';

import '../../history/history_screen.dart';
import '../../home/home_screen.dart';
import 'main_tab.dart';
import 'main_tab_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: MainTab.home.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppProviders(
          child: MainTabScaffold(
            navigationShell: navigationShell,
          ),
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
      ],
    ),
  ],
);