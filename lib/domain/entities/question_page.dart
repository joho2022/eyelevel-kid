import 'package:eyelevel_kid/domain/entities/question_record.dart';

class QuestionPage {
  final List<QuestionRecord> items;
  final String? nextCursor;
  final bool hasNext;

  const QuestionPage({
    required this.items,
    required this.nextCursor,
    required this.hasNext,
  });
}