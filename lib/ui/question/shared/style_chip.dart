import 'package:flutter/material.dart';

import '../../../domain/values/answer_style.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';

class StyleChip extends StatelessWidget {
  final AnswerStyle style;

  const StyleChip({
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final label = switch (style) {
      AnswerStyle.story => '이야기처럼',
      AnswerStyle.reason => '이유까지',
    };

    final backgroundColor = switch (style) {
      AnswerStyle.story => AppColors.storyChipBackground,
      AnswerStyle.reason => AppColors.reasonChipBackground,
    };

    final textColor = switch (style) {
      AnswerStyle.story => AppColors.storyPurple,
      AnswerStyle.reason => AppColors.reasonChipText,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: AppTheme.subtitle10.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}