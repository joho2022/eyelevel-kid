import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/state/nickname_setup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/main_tab.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_background.dart';
import '../shared/nickname_text_field.dart';
import 'view_models/nickname_setup_notifier.dart';

class NicknameSetupScreen extends ConsumerWidget {
  const NicknameSetupScreen({super.key});

  Color _buttonColor(NicknameSetupState state) {
    if (state.isLoading) {
      return AppColors.storyPurple.withValues(alpha: 0.5);
    }

    if (!state.canSubmit) {
      return AppColors.disabledGray;
    }

    return AppColors.storyPurple;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nicknameSetupNotifierProvider);
    final viewModel = ref.read(nicknameSetupNotifierProvider.notifier);

    return PopScope(
      canPop: !state.isLoading,
      child: AppBackground(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: true,

                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  leading: BackButton(color: AppColors.storyPurple),
                ),

                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '만나서 반가워요',
                          style: AppTheme.title24.copyWith(
                            color: AppColors.textDefault,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text(
                          '아이시선에서 사용할 닉네임을 입력해주세요.',
                          style: AppTheme.subtitle14.copyWith(
                            color: AppColors.textSub,
                          ),
                        ),

                        const SizedBox(height: 32),

                        NicknameTextField(
                          value: state.nickname,
                          errorText: state.errorMessage,
                          onChanged: viewModel.updateNickname,
                        ),

                        const Spacer(),
                      ],
                    ),
                  ),
                ),

                bottomNavigationBar: SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      24,
                      12,
                      24,
                      MediaQuery.of(context).viewInsets.bottom + 12,
                    ),
                    child: SizedBox(
                      height: 52,
                      child: BounceTapper(
                        onTap: state.canSubmit && !state.isLoading
                            ? () async {
                                final isSuccess = await viewModel.submit();

                                if (!context.mounted || !isSuccess) return;

                                context.go(MainTab.home.path);
                              }
                            : null,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          decoration: BoxDecoration(
                            color: _buttonColor(state),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '시작하기',
                            style: AppTheme.title14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              if (state.isLoading)
                Container(
                  color: Colors.black.withValues(alpha: 0.15),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
