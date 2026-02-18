import 'package:eyelevel_kid/ui/user/my/view_models/my_viewmodel.dart';
import 'package:eyelevel_kid/ui/core/widgets/answer_style_slider.dart';
import 'package:eyelevel_kid/ui/user/my/widgets/profile_header.dart';
import 'package:eyelevel_kid/ui/user/my/widgets/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/routes/route_paths.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/confirm_dialog.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyViewModel(
        // context.read<GetProfileUseCase>(),
        // context.read<LogoutUseCase>(),
      ),
      child: const _MyView(),
    );
  }
}

class _MyView extends StatelessWidget {
  const _MyView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 32),

              ProfileHeader(
                nickname: state.nickname,
                imagePath: state.profileImagePath,
                onImageTap: () {
                  context.push(RoutePaths.profileEdit);
                },
              ),

              const SizedBox(height: 32),

              AnswerStyleSlider(
                  selected: state.answerStyle,
                  onChanged: viewModel.changePreferredStyle
              ),

              const SizedBox(height: 32),

              SettingsSection(
                title: '앱 정보',
                items: [
                  (
                  title: '현재 버전',
                  trailing: Text(
                    '1.0.0',
                    style: AppTheme.title14.copyWith(
                        color: AppColors.iconSecondary
                    ),
                  ),
                  onTap: viewModel.onTapAppVersion,
                  textColor: AppColors.textDefault
                  ),
                  (
                  title: '평가하기',
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.iconSecondary,
                  ),
                  onTap: viewModel.onTapRateApp,
                  textColor: AppColors.textDefault
                  ),
                  (
                  title: '공유하기',
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.iconSecondary,
                  ),
                  onTap: viewModel.onTapShareApp,
                  textColor: AppColors.textDefault
                  ),
                  (
                  title: '문의하기',
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.iconSecondary,
                  ),
                  onTap: viewModel.onTapContact,
                  textColor: AppColors.textDefault
                  ),

                ],
              ),

              const SizedBox(height: 32),

              SettingsSection(
                items: [
                  (
                  title: '로그아웃',
                  trailing: const Icon(
                      Icons.chevron_right,
                      color: AppColors.iconSecondary
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => ConfirmDialog(
                        title: '로그아웃 하시겠어요?',
                        description: '다시 로그인해야 사용할 수 있어요.',
                        confirmText: '로그아웃',
                        onConfirm: viewModel.logout,
                      ),
                    );
                  },
                  textColor: AppColors.textDefault
                  ),
                  (
                  title: '탈퇴하기',
                  trailing: const Icon(
                      Icons.chevron_right,
                      color: AppColors.iconSecondary
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => ConfirmDialog(
                        title: '정말 탈퇴하시겠어요?',
                        description: '모든 기록이 삭제되고 복구할 수 없어요.',
                        confirmText: '탈퇴하기',
                        isDanger: true,
                        onConfirm: viewModel.withdraw,
                      ),
                    );
                  },
                  textColor: AppColors.iconSecondary,
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}