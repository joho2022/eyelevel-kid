import 'package:eyelevel_kid/data/sources/mock/mock_question_remote_data_source.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';
import 'package:eyelevel_kid/ui/home/widgets/home_header.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';
import 'package:eyelevel_kid/ui/core/widgets/inline_banner_ad.dart';
import 'package:eyelevel_kid/ui/home/widgets/calendar/question_calendar.dart';
import '../question/shared/question_summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    final state = context.watch<HomeViewModel>().state;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              if (state.isInitialLoading)
                const SizedBox(
                  height: 120,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                HomeHeader(
                  title: state.title,
                  subtitle: state.subtitle,
                ),

              const SizedBox(height: 32),

              const InlineBannerAd(),

              const SizedBox(height: 32),

              QuestionCalendar(
                currentMonth: state.currentMonth,
                questionDates: state.questionDates,
                selectedDay: state.selectedDay,
                onMonthChanged: viewModel.loadCalendarSummary,
                onDateSelected: viewModel.selectDate,
                onQuestionSelected: viewModel.onCalendarQuestionSelected,
              ),

              const SizedBox(height: 32),

              Text(
                '최근 질문',
                style: AppTheme.title20.copyWith(
                  color: AppColors.textDefault,
                ),
              ),

              const SizedBox(height: 12),

              Column(
                children: List.generate(state.recentQuestions.length, (index) {
                  final question = state.recentQuestions[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: QuestionSummaryCard(
                      key: ValueKey(question.id),
                      question: question,
                      onTap: () => viewModel.onRecentQuestionSelected(question),
                      onBookmarkTap: () => viewModel.toggleBookmark(question),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}