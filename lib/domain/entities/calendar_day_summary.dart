class CalendarDaySummary {
  final DateTime date;
  final List<QuestionPreview> questions;

  const CalendarDaySummary({
    required this.date,
    required this.questions,
  });

  bool get hasQuestion => questions.isNotEmpty;
}

class QuestionPreview {
  final int id;
  final String title;
  final DateTime createdAt;

  const QuestionPreview({
    required this.id,
    required this.title,
    required this.createdAt,
  });
}