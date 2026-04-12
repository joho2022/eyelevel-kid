import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';

class WeekdayRow extends StatelessWidget {
  const WeekdayRow({super.key});

  @override
  Widget build(BuildContext context) {
    const weekdays = ['일', '월', '화', '수', '목', '금', '토'];

    return Row(
      children: weekdays.map((weekday) {
        return Expanded(
          child: Center(
            child: Text(
              weekday,
              style: AppTheme.subtitle14.copyWith(
                color: AppColors.textSub,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
