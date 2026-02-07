import 'package:eyelevel_kid/ui/home/widgets/calendar/widgets/animated_question_panel.dart';
import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/home/widgets/calendar/widgets/calendar_header.dart';
import 'package:eyelevel_kid/ui/home/widgets/calendar/widgets/weekday_row.dart';
import 'package:eyelevel_kid/ui/home/widgets/calendar/widgets/calendar_grid.dart';
import '../../../../domain/entities/calendar_day_summary.dart';
import '../../../core/theme/app_colors.dart';

class QuestionCalendar extends StatefulWidget {
  final DateTime currentMonth;
  final Set<DateTime> questionDates;
  final CalendarDaySummary? selectedDay;

  final ValueChanged<DateTime> onMonthChanged;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<CalendarQuestionPreview> onQuestionSelected;

  const QuestionCalendar({
    super.key,
    required this.currentMonth,
    required this.questionDates,
    required this.selectedDay,
    required this.onMonthChanged,
    required this.onDateSelected,
    required this.onQuestionSelected,
  });

  @override
  State<QuestionCalendar> createState() => _QuestionCalendarState();
}

class _QuestionCalendarState extends State<QuestionCalendar> {
  static const int _initialPage = 10000;
  late final PageController _pageController;

  bool _isPaging = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
  }

  @override
  void didUpdateWidget(covariant QuestionCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentMonth != widget.currentMonth) {
      _pageController.jumpToPage(_initialPage);
    }
  }

  DateTime _monthFromPage(int page) {
    final diff = page - _initialPage;
    return DateTime(
      widget.currentMonth.year,
      widget.currentMonth.month + diff,
    );
  }

  void _goPrevMonth() {
    if (_isPaging) return;
    _isPaging = true;

    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _goNextMonth() {
    if (_isPaging) return;
    _isPaging = true;

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalendarHeader(
              currentMonth: widget.currentMonth,
              onPrev: _goPrevMonth,
              onNext: _goNextMonth,
            ),

            const SizedBox(height: 12),
            const WeekdayRow(),
            const SizedBox(height: 12),

            SizedBox(
              height: 280,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) {
                  final month = _monthFromPage(page);
                  widget.onMonthChanged(month);
                  _isPaging = false;
                },
                itemBuilder: (_, page) {
                  final month = _monthFromPage(page);

                  return CalendarGrid(
                    currentMonth: month,
                    questionDates: widget.questionDates,
                    onSelectDate: widget.onDateSelected,
                  );
                },
              ),
            ),

            AnimatedQuestionPanel(
              selectedDay: widget.selectedDay,
              onQuestionTap: widget.onQuestionSelected,
            ),
          ],
        ),
      ),
    );
  }
}