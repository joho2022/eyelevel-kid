import 'package:eyelevel_kid/ui/core/routes/route_paths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
import '../widgets/splash_screen.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: RoutePaths.splash,

    routes: [
      GoRoute(
        path: RoutePaths.splash,
        pageBuilder: (context, state) =>
            _buildFadePage(state: state, child: const SplashScreen()),
      ),

      GoRoute(
        path: RoutePaths.login,
        pageBuilder: (context, state) =>
            _buildFadePage(state: state, child: const LoginScreen()),
        routes: [
          GoRoute(
            path: RoutePaths.nicknameSetup,
            name: 'nickname-setup',
            builder: (context, state) => const NicknameSetupScreen(),
          ),
        ],
      ),

      StatefulShellRoute(
        pageBuilder: (context, state, navigationShell) =>
            _buildFadePage(state: state, child: navigationShell),
        navigatorContainerBuilder: (context, navigationShell, children) {
          return MainTabScaffold(
            navigationShell: navigationShell,
            children: children,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainTab.home.path,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainTab.history.path,
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MainTab.my.path,
                builder: (context, state) => const MyScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: RoutePaths.questionDetail,
        pageBuilder: (context, state) {
          final idString = state.pathParameters['id'];
          final id = int.tryParse(idString ?? '');

          if (id == null) {
            return _buildPlatformSlidePage(
              state: state,
              child: const Scaffold(body: Center(child: Text('잘못된 접근입니다'))),
            );
          }

          return _buildPlatformSlidePage(
            state: state,
            child: DetailScreen(questionId: id),
          );
        },
      ),

      GoRoute(
        path: RoutePaths.askQuestion,
        pageBuilder: (context, state) => _buildPlatformSlidePage(
          state: state,
          child: const AskQuestionScreen(),
        ),
      ),

      GoRoute(
        path: RoutePaths.profileEdit,
        pageBuilder: (context, state) => _buildPlatformSlidePage(
          state: state,
          child: const ProfileEditScreen(),
        ),
      ),
    ],
  );
}

CustomTransitionPage<void> _buildFadePage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}

Page<void> _buildPlatformSlidePage({
  required GoRouterState state,
  required Widget child,
}) {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return MaterialPage<void>(key: state.pageKey, child: child);
  }

  const curve = Curves.easeOutCubic;

  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 280),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final incoming = animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: curve)),
      );

      return ClipRect(
        child: SlideTransition(position: incoming, child: child),
      );
    },
  );
}
