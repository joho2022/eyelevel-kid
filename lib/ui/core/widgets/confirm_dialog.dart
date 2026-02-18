import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final bool isDanger;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    this.confirmText = '확인',
    this.cancelText = '취소',
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTheme.title18.copyWith(
                color: AppColors.textDefault,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              description,
              style: AppTheme.subtitle14.copyWith(
                color: AppColors.textInfo,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _buildButton(
                    text: cancelText,
                    backgroundColor: AppColors.disabledGray,
                    textColor: AppColors.iconSecondary,
                    onTap: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildButton(
                    text: confirmText,
                    backgroundColor: isDanger
                        ? AppColors.errorRed
                        : AppColors.storyPurple,
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return BounceTapper(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTheme.title14.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}