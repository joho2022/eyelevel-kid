import 'package:eyelevel_kid/ui/history/view_models/history_viewmodel.dart';
import 'package:eyelevel_kid/ui/history/widgets/history_filter_header_delegate.dart';
import 'package:eyelevel_kid/ui/history/widgets/history_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HistoryViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '기록',
                      style: AppTheme.title24.copyWith(
                        color: AppColors.textDefault,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      '이전에 물어본 질문들이에요',
                      style: AppTheme.subtitle14.copyWith(
                        color: AppColors.textSub,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: HistoryFilterHeaderDelegate(
                selected: state.filter,
                onChanged: (filter) {
                  viewModel.changeFilter(filter);

                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                  );
                },
              ),
            ),

            if (state.isInitialLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else
              HistorySliverList(
                groupedByYear: state.groupedByYear,
                onToggleBookmark: viewModel.toggleBookmark,
                onDelete: viewModel.deleteQuestion,
              ),
          ],
        ),
      ),
    );
  }
}