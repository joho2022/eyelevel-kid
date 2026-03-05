import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/nickname_setup_factory.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/state/nickname_setup_state.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/view_models/nickname_setup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../shared/nickname_text_field.dart';

class NicknameSetupScreen extends StatelessWidget {
  const NicknameSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => createNicknameSetupViewModel(),
      child: const _NicknameSetupView(),
    );
  }
}

class _NicknameSetupView extends StatelessWidget {
  const _NicknameSetupView();

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
  Widget build(BuildContext context) {
    final viewModel = context.watch<NicknameSetupViewModel>();
    final state = viewModel.state;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
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
                style: AppTheme.title24.copyWith(color: AppColors.textDefault),
              ),

              const SizedBox(height: 2),

              Text(
                '아이시선에서 사용할 닉네임을 입력해주세요.',
                style: AppTheme.subtitle14.copyWith(color: AppColors.textSub),
              ),

              const SizedBox(height: 32),

              NicknameTextField(
                value: state.nickname,
                errorText: state.errorMessage,
                onChanged: viewModel.updateNickname,
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: BounceTapper(
                  onTap: state.canSubmit && !state.isLoading
                      ? () async {
                          await viewModel.submit();
                        }
                      : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: _buttonColor(state),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            '시작하기',
                            style: AppTheme.title14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
