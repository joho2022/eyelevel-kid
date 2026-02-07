class CalendarDaySummary {
  final DateTime date;
  final List<CalendarQuestionPreview> questions;

  const CalendarDaySummary({
    required this.date,
    required this.questions,
  });

  bool get hasQuestion => questions.isNotEmpty;
}

class CalendarQuestionPreview {
  final int id;
  final String title;
  final DateTime createdAt;

  const CalendarQuestionPreview({
    required this.id,
    required this.title,
    required this.createdAt,
  });
}