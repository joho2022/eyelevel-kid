import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime currentMonth;
  final Set<DateTime> questionDates;
  final ValueChanged<DateTime> onSelectDate;

  const CalendarGrid({
    super.key,
    required this.currentMonth,
    required this.questionDates,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    final days = _daysInMonth(currentMonth);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        final date = days[index];
        if (date == null) return const SizedBox.shrink();

        final hasQuestion = _hasQuestion(date);

        return GestureDetector(
          onTap: () => onSelectDate(date),
          child: _CalendarDayCell(
            day: date.day,
            hasQuestion: hasQuestion,
          ),
        );
      },
    );
  }

  bool _hasQuestion(DateTime date) {
    return questionDates.any(
          (d) =>
      d.year == date.year &&
          d.month == date.month &&
          d.day == date.day,
    );
  }

  List<DateTime?> _daysInMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final startOffset = firstDay.weekday % 7;

    return List.generate(42, (index) {
      final dayNumber = index - startOffset + 1;
      if (dayNumber < 1 || dayNumber > daysInMonth) return null;
      return DateTime(month.year, month.month, dayNumber);
    });
  }
}

class _CalendarDayCell extends StatelessWidget {
  final int day;
  final bool hasQuestion;

  const _CalendarDayCell({
    required this.day,
    required this.hasQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        gradient: hasQuestion
            ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.calendarPurple,
            AppColors.calendarPink,
          ],
        )
            : null,
        color: hasQuestion ? null : Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$day',
            style: AppTheme.subtitle14.copyWith(
              color: hasQuestion
                  ? AppColors.white
                  : AppColors.textSecondary,
            ),
          ),

          if (hasQuestion)
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}