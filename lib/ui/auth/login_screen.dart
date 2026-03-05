import 'package:eyelevel_kid/ui/auth/state/login_state.dart';
import 'package:eyelevel_kid/ui/auth/view_models/login_viewmodel.dart';
import 'package:eyelevel_kid/ui/auth/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';
import 'package:eyelevel_kid/ui/core/theme/app_images.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'login_factory.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => createLoginViewModel(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView({super.key});

  @override
  State<_LoginView> createState() => __LoginViewState();
}

class __LoginViewState extends State<_LoginView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _titleOpacity;
  late Animation<double> _subtitleOpacity;
  late Animation<Offset> _subtitleSlide;

  @override
  void initState() {
    super.initState();

    _initAnimations();
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
    final viewModel = context.watch<LoginViewModel>();
    final state = viewModel.state;

    return Scaffold(
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

              SocialLoginButton(
                icon: AppImages.appleIcon,
                text: 'Apple로 계속하기',
                isLoading: state.isAppleLoading,
                onPressed: () {
                  // MARK: - 애플 로그인 구현
                  debugPrint('Apple 로그인 클릭');
                  context.pushNamed('nickname-setup');
                },
              ),

              const SizedBox(height: 12),

              SocialLoginButton(
                icon: AppImages.googleIcon,
                text: 'Google로 계속하기',
                isLoading: state.isGoogleLoading,
                onPressed: () async {
                  final isNewUser = await context.read<LoginViewModel>().login(
                    SocialProvider.google,
                  );

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
