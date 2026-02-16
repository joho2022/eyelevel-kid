import 'package:flutter/material.dart';

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
        Provider.value(value: DIContainer.askQuestion),
        Provider.value(value: DIContainer.saveNickname),
      ],
      child: child,
    );
  }
}