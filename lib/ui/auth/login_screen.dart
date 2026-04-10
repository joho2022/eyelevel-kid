import 'dart:io';

import 'package:eyelevel_kid/ui/auth/state/login_state.dart';
import 'package:eyelevel_kid/ui/auth/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';
import 'package:eyelevel_kid/ui/core/theme/app_images.dart';
import 'package:eyelevel_kid/ui/core/launch/app_config_prompt_presenter.dart';
import 'package:eyelevel_kid/ui/core/widgets/app_background.dart';
import 'package:go_router/go_router.dart';

import 'view_models/login_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _titleOpacity;
  late Animation<double> _subtitleOpacity;
  late Animation<Offset> _subtitleSlide;

  @override
  void initState() {
    super.initState();

    _initAnimations();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      AppConfigPromptPresenter.present(context);
    });
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _subtitleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _subtitleSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginNotifierProvider);

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.appLogo, width: 120),

                const SizedBox(height: 20),

                _buildAnimatedTitle(),

                const SizedBox(height: 80),

                if (Platform.isIOS) ...[
                  SocialLoginButton(
                    icon: AppImages.appleIcon,
                    text: 'Apple로 계속하기',
                    isLoading: state.isAppleLoading,
                    onPressed: () async {
                      final isNewUser = await ref
                          .read(loginNotifierProvider.notifier)
                          .login(SocialProvider.apple);

                      if (isNewUser == null || !context.mounted) return;

                      if (isNewUser) {
                        context.pushNamed('nickname-setup');
                      } else {
                        context.goNamed('home');
                      }
                    },
                  ),

                  const SizedBox(height: 12),
                ],

                SocialLoginButton(
                  icon: AppImages.googleIcon,
                  text: 'Google로 계속하기',
                  isLoading: state.isGoogleLoading,
                  onPressed: () async {
                    final isNewUser = await ref
                        .read(loginNotifierProvider.notifier)
                        .login(SocialProvider.google);

                    if (isNewUser == null || !context.mounted) return;

                    if (isNewUser) {
                      context.pushNamed('nickname-setup');
                    } else {
                      context.goNamed('home');
                    }
                  },
                ),

                const SizedBox(height: 30),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTheme.label12.copyWith(color: AppColors.textInfo),
                    children: [
                      const TextSpan(text: '계속 진행하시면 '),
                      TextSpan(
                        text: '서비스 이용약관',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: ' 및\n'),
                      TextSpan(
                        text: '개인정보 처리방침',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: '에 동의하는 것으로 간주됩니다.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedTitle() {
    return Column(
      children: [
        FadeTransition(
          opacity: _titleOpacity,
          child: Text('아이시선', style: AppTheme.title28),
        ),

        const SizedBox(height: 8),

        FadeTransition(
          opacity: _subtitleOpacity,
          child: SlideTransition(
            position: _subtitleSlide,
            child: Text(
              '아이의 눈높이에서\n세상을 설명해드려요',
              textAlign: TextAlign.center,
              style: AppTheme.subtitle14.copyWith(color: AppColors.textSub),
            ),
          ),
        ),
      ],
    );
  }
}
