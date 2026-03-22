import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class AppConfigDialog extends StatelessWidget {
  final String title;
  final String body;
  final String confirmText;
  final String? cancelText;
  final String? secondaryText;
  final bool barrierDismissible;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final VoidCallback? onSecondary;

  const AppConfigDialog({
    super.key,
    required this.title,
    required this.body,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.secondaryText,
    this.barrierDismissible = true,
    this.onCancel,
    this.onSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: barrierDismissible,
      child: Dialog(
        backgroundColor: AppColors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTheme.title20.copyWith(
                  color: AppColors.textDefault,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                body,
                textAlign: TextAlign.center,
                style: AppTheme.subtitle14.copyWith(
                  color: AppColors.textInfo,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (cancelText != null) ...[
                    Expanded(
                      child: _DialogActionButton(
                        text: cancelText!,
                        backgroundColor: AppColors.disabledGray,
                        textColor: AppColors.iconSecondary,
                        onTap: onCancel ?? () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: _DialogActionButton(
                      text: confirmText,
                      backgroundColor: AppColors.storyPurple,
                      textColor: AppColors.white,
                      onTap: onConfirm,
                    ),
                  ),
                ],
              ),
              if (secondaryText != null) ...[
                const SizedBox(height: 12),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: onSecondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      secondaryText!,
                      style: AppTheme.subtitle12.copyWith(
                        color: AppColors.textSub,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _DialogActionButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
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
