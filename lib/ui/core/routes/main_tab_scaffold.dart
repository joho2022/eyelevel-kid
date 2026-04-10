import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_background.dart';
import 'main_tab.dart';
import '../../history/view_models/history_notifier.dart';
import '../../home/view_models/home_notifier.dart';
import '../../user/my/view_models/my_notifier.dart';

class MainTabScaffold extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainTabScaffold({super.key, required this.navigationShell});

  @override
  ConsumerState<MainTabScaffold> createState() => _MainTabScaffoldState();
}

class _MainTabScaffoldState extends ConsumerState<MainTabScaffold> {
  @override
  void initState() {
    super.initState();
    ref.read(homeNotifierProvider);
    ref.read(historyNotifierProvider);
    ref.read(myNotifierProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: widget.navigationShell,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            elevation: 0,
            currentIndex: widget.navigationShell.currentIndex,
            selectedItemColor: AppColors.storyPurple,
            unselectedItemColor: AppColors.iconSecondary,
            selectedLabelStyle: AppTheme.title14.copyWith(fontSize: 12),
            unselectedLabelStyle: AppTheme.title14.copyWith(fontSize: 12),
            onTap: (index) {
              widget.navigationShell.goBranch(
                index,
                initialLocation: index == widget.navigationShell.currentIndex,
              );
            },
            items: MainTab.values.map((tab) {
              return BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.label,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
