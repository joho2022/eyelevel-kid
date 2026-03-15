import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  final String nickname;
  final String? imagePath;
  final VoidCallback onImageTap;

  const ProfileHeader({
    super.key,
    required this.nickname,
    required this.imagePath,
    required this.onImageTap,
  });

  Widget _buildProfileImage() {
    if (imagePath == null) {
      return const Icon(
        Icons.person,
        size: 42,
        color: AppColors.profilePlaceholderIcon,
      );
    }

    return Image.network(
      imagePath!,
      fit: BoxFit.cover,
      width: 72,
      height: 72,

      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;

        return const Icon(
          Icons.person,
          size: 42,
          color: AppColors.profilePlaceholderIcon,
        );
      },

      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          Icons.person,
          size: 42,
          color: AppColors.profilePlaceholderIcon,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$nickname님!',
                style: AppTheme.title24.copyWith(
                  color: AppColors.storyPurple,
                ),
              ),
              Text(
                '오늘은 어떤 세상을 알려드렸나요?',
                style: AppTheme.title18.copyWith(
                  color: AppColors.textDefault,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        GestureDetector(
          onTap: onImageTap,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.profilePlaceholderBackground,
                ),
                child: ClipOval(
                  child: _buildProfileImage(),
                ),
              ),

              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}