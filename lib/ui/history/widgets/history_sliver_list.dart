import 'package:flutter/material.dart';

import '../../../domain/entities/question_record.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../question/shared/question_summary_card.dart';
import 'history_list_item.dart';

class HistorySliverList extends StatelessWidget {
  final Map<int, List<QuestionRecord>> groupedByYear;
  final ValueChanged<int> onTapQuestion;
  final ValueChanged<int> onToggleBookmark;
  final ValueChanged<int> onDelete;

  const HistorySliverList({
    super.key,
    required this.groupedByYear,
    required this.onTapQuestion,
    required this.onToggleBookmark,
    required this.onDelete,
  });

  List<HistoryListItem> _flatten() {
    final result = <HistoryListItem>[];

    final sorted = groupedByYear.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    for (final entry in sorted) {
      result.add(HistoryYearHeader(entry.key));

      for (final q in entry.value) {
        result.add(HistoryQuestionItem(q));
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final items = _flatten();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final item = items[index];

          if (item is HistoryYearHeader) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Text(
                '${item.year}년',
                style: AppTheme.title20.copyWith(
                  color: AppColors.textDefault,
                ),
              ),
            );
          }

          if (item is HistoryQuestionItem) {
            final q = item.question;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(bottom: 12),
              child: Dismissible(
                key: ValueKey(q.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => onDelete(q.id),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: QuestionSummaryCard(
                  question: q,
                  onTap: () => onTapQuestion(q.id),
                  onBookmarkTap: () => onToggleBookmark(q.id),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
        childCount: items.length,
      ),
    );
  }
}