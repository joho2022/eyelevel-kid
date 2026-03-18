import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/nickname_setup_factory.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/state/nickname_setup_state.dart';
import 'package:eyelevel_kid/ui/user/nickname_setup/view_models/nickname_setup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_background.dart';
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
                    MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SizedBox(
                    height: 52,
                    child: BounceTapper(
                      onTap: state.canSubmit && !state.isLoading
                          ? () async {
                        await viewModel.submit();
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
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
