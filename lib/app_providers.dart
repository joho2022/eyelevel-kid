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
        Provider.value(value: DIContainer.getQuestionPage),
        Provider.value(value: DIContainer.observeRecentQuestions),
        Provider.value(value: DIContainer.observeAllQuestions),
        Provider.value(value: DIContainer.toggleBookmark),
        Provider.value(value: DIContainer.deleteQuestion),
        Provider.value(value: DIContainer.getCalendarSummary),
        Provider.value(value: DIContainer.getQuestionsByDate),
        Provider.value(value: DIContainer.getAllQuestionsSnapshot),
        Provider.value(value: DIContainer.getQuestionDetail),
      ],
      child: child,
    );
  }
}