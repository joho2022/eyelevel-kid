import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:eyelevel_kid/ui/history/history_factory.dart';
import 'package:eyelevel_kid/ui/history/view_models/history_viewmodel.dart';
import 'package:eyelevel_kid/ui/home/home_factory.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';
import 'package:eyelevel_kid/ui/user/my/my_factory.dart';
import 'package:eyelevel_kid/ui/user/my/view_models/my_viewmodel.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_background.dart';
import 'main_tab.dart';

class MainTabScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainTabScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          lazy: false,
          create: (_) => createHomeViewModel(),
        ),
        ChangeNotifierProvider<HistoryViewModel>(
          lazy: false,
          create: (_) => createHistoryViewModel(),
        ),
        ChangeNotifierProvider<MyViewModel>(
          lazy: false,
          create: (_) => createMyViewModel(),
        ),
      ],
      child: AppBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: navigationShell,
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
              currentIndex: navigationShell.currentIndex,
              selectedItemColor: AppColors.storyPurple,
              unselectedItemColor: AppColors.iconSecondary,
              selectedLabelStyle: AppTheme.title14.copyWith(fontSize: 12),
              unselectedLabelStyle: AppTheme.title14.copyWith(fontSize: 12),
              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
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
      ),
    );
  }
}
