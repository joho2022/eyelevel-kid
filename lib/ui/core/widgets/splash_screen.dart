import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/app_auth_state.dart';
import '../../../core/auth/view_models/app_auth_notifier.dart';
import '../routes/main_tab.dart';
import '../routes/route_paths.dart';
import '../theme/app_images.dart';
import 'app_background.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController fadeAnimationController;
  late final Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: fadeAnimationController, curve: Curves.easeOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startSplashFlow();
    });
  }

  Future<void> startSplashFlow() async {
    final appAuthNotifier = ref.read(appAuthNotifierProvider.notifier);

    await Future.wait([
      appAuthNotifier.initialize(),
      Future.delayed(const Duration(seconds: 3)),
    ]);

    await fadeAnimationController.forward();

    if (!mounted) return;

    final targetPath = ref
        .read(appAuthNotifierProvider)
        .maybeWhen(
          unauthenticated: () => RoutePaths.login,
          authenticated: (needsOnboarding) {
            if (needsOnboarding) {
              return '${RoutePaths.login}/${RoutePaths.nicknameSetup}';
            }

            return MainTab.home.path;
          },
          orElse: () => RoutePaths.login,
        );

    context.pushReplacement(targetPath);
  }

  @override
  void dispose() {
    fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FadeTransition(
          opacity: opacityAnimation,
          child: Center(
            child: Image.asset(
              AppImages.appLogo,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
