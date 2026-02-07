import 'package:flutter/material.dart';

import '../../../../../core/utils/date_format.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../../../domain/entities/question_record.dart';

class QuestionSummaryCard extends StatelessWidget {
  final QuestionRecord question;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const QuestionSummaryCard({
    super.key,
    required this.question,
    this.onTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),

            Text(
              question.title,
              style: AppTheme.title16.copyWith(color: AppColors.textDefault),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 72,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.questionBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  question.answer,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.subtitle14.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _StyleChip(style: question.style),

                const SizedBox(width: 12),

                Text(
                  DateFormat.mdKoreanHm(question.createdAt),
                  style: AppTheme.subtitle14.copyWith(color: AppColors.textInfo),
                ),

                const Spacer(),

                _BookmarkButton(
                  isBookmarked: question.isBookmarked,
                  onTap: onBookmarkTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StyleChip extends StatelessWidget {
  final AnswerStyle style;

  const _StyleChip({
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
      AnswerStyle.story => AppColors.storyChipText,
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

class _BookmarkButton extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback? onTap;

  const _BookmarkButton({
    required this.isBookmarked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: isBookmarked ? AppColors.questionBackground : AppColors.bookmarkBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          size: 20,
          color: isBookmarked ? AppColors.storyChipText : AppColors.bookmarkIcon,
        ),
      ),
    );
  }
}
