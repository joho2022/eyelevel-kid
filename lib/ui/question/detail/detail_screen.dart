import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/core/utils/date_format.dart';
import 'package:eyelevel_kid/ui/question/detail/detail_factory.dart';
import 'package:eyelevel_kid/ui/question/detail/view_models/detail_viewmodel.dart';
import 'package:eyelevel_kid/ui/question/shared/style_chip.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/question_record.dart';
import '../../../domain/values/answer_style.dart';
import '../../core/routes/route_paths.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_background.dart';

class DetailScreen extends StatelessWidget {
  final int questionId;

  const DetailScreen({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => createDetailViewModel(questionId),
      child: const _DetailView(),
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final state = viewModel.state;

    final record = state.record;

    if (record == null) {
      return AppBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Text(
              '질문을 불러오지 못했습니다',
              style: AppTheme.subtitle12.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ),
      );
    }

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: AppColors.storyPurple,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _QuestionCard(record: record),
              const SizedBox(height: 20),
              _AnswerCard(
                answer: record.answer,
                style: record.style,
              ),
              const SizedBox(height: 20),
              _DetailBottomBar(
                isBookmarked: record.isBookmarked,
                onBookmark: viewModel.toggleBookmark,
                onReAsk: () {
                  context.push(RoutePaths.askQuestion);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final QuestionRecord record;

  const _QuestionCard({required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          Text(
            record.title,
            style: AppTheme.title14.copyWith(
              color: AppColors.textDefault,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              StyleChip(style: record.style),
              const SizedBox(width: 8),
              Text(
                DateFormat.ymdKoreanAmPm(record.createdAt),
                style: AppTheme.subtitle12.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnswerCard extends StatelessWidget {
  final String answer;
  final AnswerStyle style;

  const _AnswerCard({
    required this.answer,
    required this.style,
  });

  Color _borderColor() {
    switch (style) {
      case AnswerStyle.story:
        return AppColors.answerStoryBorder;
      case AnswerStyle.reason:
        return AppColors.answerReasonBorder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _borderColor(),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        answer,
        style: AppTheme.body14.copyWith(
          color: AppColors.textDefault,
          height: 1.6,
        ),
      ),
    );
  }
}

class _DetailBottomBar extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onBookmark;
  final VoidCallback onReAsk;

  const _DetailBottomBar({
    super.key,
    required this.isBookmarked,
    required this.onBookmark,
    required this.onReAsk,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: BounceTapper(
              onTap: onBookmark,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isBookmarked
                      ? AppColors.questionBackground
                      : AppColors.bookmarkBackground,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      size: 18,
                      color: isBookmarked
                          ? AppColors.storyPurple
                          : AppColors.bookmarkIcon,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: BounceTapper(
              onTap: onReAsk,
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.storyPurple,
                ),
                child: Text(
                  '다시 질문하기',
                  style: AppTheme.title14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
