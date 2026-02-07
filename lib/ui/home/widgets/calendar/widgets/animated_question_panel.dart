

import 'package:flutter/material.dart';

import '../../../../../core/utils/date_format.dart';
import '../../../../../domain/entities/calendar_day_summary.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class AnimatedQuestionPanel extends StatelessWidget {
  final CalendarDaySummary? selectedDay;
  final ValueChanged<CalendarQuestionPreview> onQuestionTap;

  const AnimatedQuestionPanel({
    super.key,
    required this.selectedDay,
    required this.onQuestionTap,
  });

  @override
  Widget build(BuildContext context) {
    final visible = selectedDay != null;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: visible ? 1 : 0,
        child: visible
            ? Padding(
          padding: const EdgeInsets.only(top: 16),
          child: _QuestionPanelContent(
            day: selectedDay!,
            onQuestionTap: onQuestionTap,
          ),
        )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class _QuestionPanelContent extends StatefulWidget {
  final CalendarDaySummary day;
  final ValueChanged<CalendarQuestionPreview> onQuestionTap;

  const _QuestionPanelContent({
    super.key,
    required this.day,
    required this.onQuestionTap,
  });

  @override
  State<_QuestionPanelContent> createState() => _QuestionPanelContentState();
}

class _QuestionPanelContentState extends State<_QuestionPanelContent> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 16, 0),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            '${DateFormat.ymdKorean(widget.day.date)} 질문',
            style: AppTheme.title14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 160,
            child: Scrollbar(
              controller: _controller,
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              child: ListView.separated(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.day.questions.length,
                itemBuilder: (_, index) {
                  final question = widget.day.questions[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _QuestionListCell(
                      question: widget.day.questions[index],
                      onTap: () => widget.onQuestionTap(question),
                    ),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionListCell extends StatelessWidget {
  final CalendarQuestionPreview question;
  final VoidCallback onTap;

  const _QuestionListCell({
    super.key,
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: AppColors.questionBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.subtitle14.copyWith(
                  color: AppColors.textDefault,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              DateFormat.hm(question.createdAt),
              style: AppTheme.subtitle12.copyWith(
                color: AppColors.textInfo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}