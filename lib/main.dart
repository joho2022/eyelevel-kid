import 'package:flutter/material.dart';

import 'root_screen.dart';
import 'shared/layout/app_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const RootScreen(),
        ),
    );
  }
}