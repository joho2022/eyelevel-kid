import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/state/profile_edit_state.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/profile_edit_factory.dart';
import 'package:eyelevel_kid/ui/user/profile_edit/view_models/profile_edit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_background.dart';
import '../shared/nickname_text_field.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => createProfileEditViewModel(),
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

  Widget _buildProfileImage(ProfileEditState state) {
    if (state.imageFile != null) {
      return Image.file(state.imageFile!, fit: BoxFit.cover);
    }

    if (state.imagePath != null) {
      return Image.network(state.imagePath!, fit: BoxFit.cover);
    }

    return Icon(
      Icons.person,
      size: 64,
      color: AppColors.profilePlaceholderIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileEditViewModel>();
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
                  leading: BackButton(color: AppColors.storyPurple),
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors.profilePlaceholderBackground,
                                  ),
                                  child: ClipOval(
                                    child: _buildProfileImage(state),
                                  ),
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
                                final success = await viewModel.submit();

                                if (success && context.mounted) {
                                  context.pop();
                                }
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
