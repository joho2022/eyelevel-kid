import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppToast {
  AppToast._();

  static OverlayEntry? _entry;

  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
    double bottomOffset = 72,
  }) {
    _entry?.remove();
    _entry = null;

    final overlay = Overlay.of(context);
    if (!overlay.mounted) return;

    _entry = OverlayEntry(
      builder: (context) {
        final bottomInset = MediaQuery.of(context).padding.bottom;

        return IgnorePointer(
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  24,
                  0,
                  24,
                  bottomOffset + bottomInset,
                ),
                child: _TimedToast(
                  message: message,
                  duration: duration,
                  onDismissed: () {
                    _entry?.remove();
                    _entry = null;
                  },
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(_entry!);
  }
}

class _TimedToast extends StatefulWidget {
  final String message;
  final Duration duration;
  final VoidCallback onDismissed;

  const _TimedToast({
    required this.message,
    required this.duration,
    required this.onDismissed,
  });

  @override
  State<_TimedToast> createState() => _TimedToastState();
}

class _TimedToastState extends State<_TimedToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
      reverseDuration: const Duration(milliseconds: 220),
    )..forward();

    _dismissTimer = Timer(widget.duration, () async {
      if (!mounted) return;
      await _controller.reverse();
      if (mounted) {
        widget.onDismissed();
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppToastTransition(
      animation: _controller,
      child: AppToastBody(message: widget.message),
    );
  }
}

class _ToastBody extends StatelessWidget {
  final String message;

  const _ToastBody({this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2B2B2F),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: AppTheme.subtitle12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class AppToastBody extends StatelessWidget {
  final String message;

  const AppToastBody({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return _ToastBody(message: message);
  }
}

class AppToastTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const AppToastTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    return FadeTransition(opacity: fadeAnimation, child: child);
  }
}
