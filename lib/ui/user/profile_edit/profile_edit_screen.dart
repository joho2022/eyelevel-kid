import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/state/profile_edit_state.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/view_models/profile_edit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../domain/usecases/get_user_use_case.dart';
import '../../../domain/usecases/save_profile_use_case.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../shared/nickname_text_field.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileEditViewModel(
        saveProfileUseCase: context.read<SaveProfileUseCase>(),
        getUserUseCase: context.read<GetUserUseCase>(),
      ),
      child: const _ProfileEditView(),
    );
  }
}

class _ProfileEditView extends StatelessWidget {
  const _ProfileEditView();

  Color _buttonColor(ProfileEditState state) {
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
    final viewModel = context.watch<ProfileEditViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: BackButton(
          color: AppColors.storyPurple,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: viewModel.onImageTap,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.profilePlaceholderBackground,
                          image: state.imagePath != null
                              ? DecorationImage(
                            image: AssetImage(state.imagePath!),
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        child: state.imagePath == null
                            ? Icon(
                          Icons.person,
                          size: 64,
                          color: AppColors.profilePlaceholderIcon,
                        )
                            : null,
                      ),

                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

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

      bottomNavigationBar: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24,
          right: 24,
          top: 12,
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 52,
            child: BounceTapper(
              onTap: state.canSubmit && !state.isLoading
                  ? () async {
                final success = await viewModel.submit();

                if (success && context.mounted) {
                  context.pop();
                }
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
                  '저장하기',
                  style: AppTheme.title14.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}