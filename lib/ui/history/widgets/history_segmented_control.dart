import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../state/history_state.dart';

class HistorySegmentedControl extends StatelessWidget {
  final HistoryFilter selected;
  final ValueChanged<HistoryFilter> onChanged;

  const HistorySegmentedControl({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final indicatorWidth = constraints.maxWidth / 2;

            return Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  alignment: selected == HistoryFilter.all
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: indicatorWidth,
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: selected == HistoryFilter.all
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        end: selected == HistoryFilter.all
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        colors: const [
                          AppColors.storyPurple,
                          AppColors.storyPurpleLight,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                Row(
                  children: HistoryFilter.values.map((filter) {
                    final isSelected = filter == selected;

                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onChanged(filter),
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                            style: AppTheme.title14.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.textTertiary,
                            ),
                            child: Text(
                                filter == HistoryFilter.all ? '전체' : '저장됨'
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}