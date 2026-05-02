import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime currentMonth;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const CalendarHeader({
    super.key,
    required this.currentMonth,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Text(
            '질문 달력',
            style: AppTheme.title20.copyWith(
              color: AppColors.textDefault,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onPrev,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: const Icon(Icons.chevron_left),
                ),

                Text(
                  '${currentMonth.year}년 ${currentMonth.month}월',
                  style: AppTheme.subtitle14.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                IconButton(
                  onPressed: onNext,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}