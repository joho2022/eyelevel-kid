class QuestionRecord {
  final int id;
  final String title;
  final String answer;
  final AnswerStyle style;
  final DateTime createdAt;
  final bool isBookmarked;

  const QuestionRecord({
    required this.id,
    required this.title,
    required this.answer,
    required this.style,
    required this.createdAt,
    required this.isBookmarked,
  });
}

enum AnswerStyle {
  story,
  reason
}