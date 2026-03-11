import 'package:eyelevel_kid/ui/core/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/app_auth_state.dart';
import '../../../core/auth/app_auth_viewmodel.dart';
import '../../auth/login_screen.dart';
import '../../history/history_screen.dart';
import '../../home/home_screen.dart';
import '../../question/ask/ask_screen.dart';
import '../../question/detail/detail_screen.dart';
import '../../user/my/my_screen.dart';
import '../../user/nickname_setup/nickname_setup_screen.dart';
import '../../user/profile_edit/profile_edit_screen.dart';
import 'main_tab.dart';
import 'main_tab_scaffold.dart';

GoRouter createAppRouter(AppAuthViewModel authViewModel) {
  return GoRouter(
    initialLocation: RoutePaths.login,

    refreshListenable: authViewModel,

    redirect: (context, state) {
      final current = state.matchedLocation;

      return authViewModel.state.when(
        splash: () => null,

        unauthenticated: () {
          if (current != RoutePaths.login) {
            return RoutePaths.login;
          }
          return null;
        },

        authenticated: (_) {
          if (current == RoutePaths.login) {
            return MainTab.home.path;
          }
          return null;
        },

        error: (_) => RoutePaths.login,
      );
    },

    routes: [
      GoRoute(
        path: RoutePaths.login,
        builder: (_, __) => const LoginScreen(),
        routes: [
          GoRoute(
            path: RoutePaths.nicknameSetup,
            name: 'nickname-setup',
            builder: (_, __) => const NicknameSetupScreen(),
          ),
        ],
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainTabScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainTab.home.path,
                name: 'home',
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
          ),
        ],
      ),

      GoRoute(
        path: RoutePaths.questionDetail,
        builder: (context, state) {
          final idString = state.pathParameters['id'];
          final id = int.tryParse(idString ?? '');

          if (id == null) {
            return const Scaffold(
              body: Center(child: Text('잘못된 접근입니다')),
            );
          }

          return DetailScreen(questionId: id);
        },
      ),

      GoRoute(
        path: RoutePaths.askQuestion,
        builder: (_, __) => const AskQuestionScreen(),
      ),

      GoRoute(
        path: RoutePaths.profileEdit,
        builder: (_, __) => const ProfileEditScreen(),
      ),
    ],
  );
}
