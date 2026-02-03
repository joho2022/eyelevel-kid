import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';
import 'package:eyelevel_kid/ui/home/widgets/home_header.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';
import 'package:eyelevel_kid/ui/core/widgets/inline_banner_ad.dart';
import 'package:eyelevel_kid/ui/home/widgets/calendar/question_calendar.dart';
import 'package:eyelevel_kid/data/repositories/mock_calendar_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(MockCalendarRepository()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

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

              const SizedBox(height: 24),

              const InlineBannerAd(),

              const SizedBox(height: 24),

              const SizedBox(height: 8),

              QuestionCalendar(
                currentMonth: state.currentMonth,
                questionDates: state.questionDates,
                selectedDay: state.selectedDay,
                onMonthChanged: viewModel.loadCalendarSummary,
                onDateSelected: viewModel.selectDate,
                onQuestionSelected: viewModel.onQuestionSelected,
              ),

              // 이후 홈 컨텐츠들
              // HomeListSection()
            ],
          ),
        ),
      ),
    );
  }
}