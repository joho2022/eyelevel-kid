import 'package:eyelevel_kid/ui/my/view_models/my_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/history/view_models/history_viewmodel.dart';
import 'package:eyelevel_kid/ui/home/view_models/home_viewmodel.dart';
import 'di_container.dart';

import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(
            DIContainer.getQuestionPage,
            DIContainer.getCalendarSummary,
            DIContainer.getQuestionsByDate,
            DIContainer.observeRecentQuestions,
            DIContainer.toggleBookmark,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryViewModel(
            DIContainer.observeAllQuestions,
            DIContainer.toggleBookmark,
            DIContainer.deleteQuestion,
            DIContainer.getAllQuestionsSnapshot,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => MyViewModel(
          ),
        ),
      ],
      child: child,
    );
  }
}