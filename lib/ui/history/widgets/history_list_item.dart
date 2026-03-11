import '../../../domain/entities/question_record.dart';

abstract class HistoryListItem {}

class HistoryYearHeader extends HistoryListItem {
  final int year;
  HistoryYearHeader(this.year);
}

class HistoryQuestionItem extends HistoryListItem {
  final QuestionRecord question;
  HistoryQuestionItem(this.question);
}