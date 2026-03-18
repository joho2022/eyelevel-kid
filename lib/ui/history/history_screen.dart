import 'package:eyelevel_kid/ui/history/view_models/history_viewmodel.dart';
import 'package:eyelevel_kid/ui/history/widgets/history_filter_header_delegate.dart';
import 'package:eyelevel_kid/ui/history/widgets/history_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/routes/route_paths.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';
import '../core/theme/app_theme.dart';
import '../core/widgets/app_background.dart';
import 'history_factory.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => createHistoryViewModel(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatefulWidget {
  const _HistoryView({super.key});

  @override
  State<_HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<_HistoryView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final viewModel = context.read<HistoryViewModel>();

    if (!_scrollController.hasClients) return;

    final threshold = 200.0;

    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - threshold) {
      viewModel.loadMore();
    }
  }

  List<Widget> _buildBody(HistoryViewModel viewModel) {
    final state = viewModel.state;

    if (state.isInitialLoading) {
      return const [
        SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
      ];
    }

    if (state.groupedByYear.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.appSadLogo, width: 60),

                const SizedBox(height: 8),

                Text(
                  '현재 기록이 없어요',
                  style: AppTheme.title20.copyWith(color: AppColors.textSub),
                ),
              ],
            ),
          ),
        ),
      ];
    }

    return [
      HistorySliverList(
        groupedByYear: state.groupedByYear,
        onTapQuestion: (id) {
          context.push(RoutePaths.questionDetailPath(id));
        },
        onToggleBookmark: viewModel.toggleBookmark,
        onDelete: viewModel.deleteQuestion,
      ),

      if (state.isLoadingMore)
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HistoryViewModel>();
    final state = viewModel.state;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
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

              ..._buildBody(viewModel),
            ],
          ),
        ),
      ),
    );
  }
}
