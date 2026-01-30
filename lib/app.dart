import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/core/layout/app_background.dart';

class MyApp extends StatelessWidget {
  final Widget home;

  const MyApp({
    super.key,
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home,
      ),
    );
  }
}