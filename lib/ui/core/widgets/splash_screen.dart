import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/app_auth_state.dart';
import '../../../core/auth/app_auth_viewmodel.dart';
import '../routes/main_tab.dart';
import '../routes/route_paths.dart';
import '../theme/app_images.dart';
import 'app_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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

    opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: fadeAnimationController,
        curve: Curves.easeOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startSplashFlow();
    });
  }

  Future<void> startSplashFlow() async {
    final appAuthViewModel = Provider.of<AppAuthViewModel>(
      context,
      listen: false,
    );

    await Future.wait([
      appAuthViewModel.initialize(),
      Future.delayed(const Duration(seconds: 3)),
    ]);

    await fadeAnimationController.forward();

    if (!mounted) return;

    final targetPath = appAuthViewModel.state.maybeWhen(
      unauthenticated: () => RoutePaths.login,
      authenticated: (needsOnboarding) {
        if (needsOnboarding) {
          return '${RoutePaths.login}/${RoutePaths.nicknameSetup}';
        }

        return MainTab.home.path;
      },
      orElse: () => RoutePaths.login,
    );

    context.go(targetPath);
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
