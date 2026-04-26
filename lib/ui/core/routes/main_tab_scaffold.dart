import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_background.dart';
import '../widgets/app_toast.dart';
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

class _MainTabScaffoldState extends ConsumerState<MainTabScaffold>
    with SingleTickerProviderStateMixin {
  static const Duration _exitGracePeriod = Duration(seconds: 2);

  Timer? _exitTimer;
  OverlayEntry? _exitToastEntry;
  late final AnimationController _toastController;
  bool _waitingForExitConfirmation = false;

  @override
  void initState() {
    super.initState();
    _toastController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
      reverseDuration: const Duration(milliseconds: 180),
    );
    ref.read(homeNotifierProvider);
    ref.read(historyNotifierProvider);
    ref.read(myNotifierProvider);
  }

  @override
  void dispose() {
    _exitTimer?.cancel();
    _removeExitToast(immediate: true);
    _toastController.dispose();
    super.dispose();
  }

  void _showExitToast() {
    _removeExitToast(immediate: true);

    final overlay = Overlay.of(context);
    if (!mounted || overlay.mounted == false) return;

    _exitToastEntry = OverlayEntry(
      builder: (context) {
        final bottomInset = MediaQuery.of(context).padding.bottom;

        return IgnorePointer(
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 72 + bottomInset),
                child: _ExitToast(animation: _toastController),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(_exitToastEntry!);
    _toastController.forward(from: 0);
  }

  void _removeExitToast({bool immediate = false}) {
    final entry = _exitToastEntry;
    if (entry == null) return;

    if (immediate) {
      entry.remove();
      _exitToastEntry = null;
      return;
    }

    _toastController.reverse().whenComplete(() {
      if (_exitToastEntry == entry) {
        entry.remove();
        _exitToastEntry = null;
      }
    });
  }

  void _handleAndroidBackPress() {
    if (_waitingForExitConfirmation) {
      _removeExitToast(immediate: true);
      SystemNavigator.pop();
      return;
    }

    setState(() {
      _waitingForExitConfirmation = true;
    });

    _showExitToast();

    _exitTimer?.cancel();
    _exitTimer = Timer(_exitGracePeriod, () {
      if (!mounted) return;
      _removeExitToast();
      setState(() {
        _waitingForExitConfirmation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;

    return AppBackground(
      child: PopScope(
        canPop: !isAndroid,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop || !isAndroid) return;
          _handleAndroidBackPress();
        },
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
      ),
    );
  }
}

class _ExitToast extends StatelessWidget {
  final Animation<double> animation;

  const _ExitToast({required this.animation});

  @override
  Widget build(BuildContext context) {
    final fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );

    return FadeTransition(
      opacity: fadeAnimation,
      child: Material(
        color: Colors.transparent,
        child: const AppToastBody(message: '버튼을 한번 더 누르면 앱이 종료돼요.'),
      ),
    );
  }
}
