import 'package:flutter/material.dart';

import '../../../domain/entities/question_record.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/question_summary_card.dart';

class HistorySliverList extends StatelessWidget {
  final Map<int, List<QuestionRecord>> groupedByYear;
  final ValueChanged<int> onToggleBookmark;
  final ValueChanged<int> onDelete;

  const HistorySliverList({
    super.key,
    required this.groupedByYear,
    required this.onToggleBookmark,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (groupedByYear.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Text(
            '아직 기록이 없어요',
            style: AppTheme.title20.copyWith(
              color: AppColors.textDefault,
            ),
          ),
        ),
      );
    }

    final items = groupedByYear.entries.toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final entry = items[index];
          final year = entry.key;
          final questions = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                Text(
                  '$year년',
                  style: AppTheme.title20.copyWith(
                    color: AppColors.textDefault,
                  ),
                ),

                const SizedBox(height: 12),

                ...questions.map((q) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
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
                        onBookmarkTap: () => onToggleBookmark(q.id),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }
}