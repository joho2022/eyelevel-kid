import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';
import 'package:eyelevel_kid/ui/home/widgets/home_header.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel()..loadHome(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeViewModel>().state;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              if (state.isLoading)
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

              // 이후 홈 컨텐츠들
              // HomeCalendar()
              // HomeListSection()
            ],
          ),
        ),
      ),
    );
  }
}