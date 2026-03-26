import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class ProfileHeader extends StatefulWidget {
  final String nickname;
  final String? imagePath;
  final VoidCallback onImageTap;
  final Future<void> Function()? onImageLoadFailed;

  const ProfileHeader({
    super.key,
    required this.nickname,
    required this.imagePath,
    required this.onImageTap,
    this.onImageLoadFailed,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool _didRetryForCurrentUrl = false;
  bool _isImageLoaded = false;

  @override
  void didUpdateWidget(covariant ProfileHeader oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.imagePath != widget.imagePath) {
      _didRetryForCurrentUrl = false;
      _isImageLoaded = false;
    }
  }

  Widget _buildFallbackIcon() {
    return Container(
      width: 72,
      height: 72,
      color: AppColors.profilePlaceholderBackground,
      alignment: Alignment.center,
      child: const Icon(
        Icons.person,
        size: 42,
        color: AppColors.profilePlaceholderIcon,
      ),
    );
  }

  Widget _buildProfileImage() {
    final imagePath = widget.imagePath;

    if (imagePath == null || imagePath.isEmpty) {
      return _buildFallbackIcon();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          opacity: _isImageLoaded ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Image.network(
            imagePath,
            key: ValueKey(imagePath),
            fit: BoxFit.cover,
            width: 72,
            height: 72,

            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                if (!_isImageLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted) return;
                    setState(() {
                      _isImageLoaded = true;
                    });
                  });
                }
              }

              return child;
            },

            errorBuilder: (context, error, stackTrace) {
              if (!_didRetryForCurrentUrl && widget.onImageLoadFailed != null) {
                _didRetryForCurrentUrl = true;

                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await widget.onImageLoadFailed?.call();
                });
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
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
                '${widget.nickname}님!',
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
          onTap: widget.onImageTap,
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