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
  static const int _centerPage = 1;
  static const double _tabletBreakpoint = 700;
  static const double _maxCalendarWidth = 560;
  static const double _horizontalPadding = 20;
  static const double _gridSpacing = 6;

  late final PageController _pageController;
  late DateTime _visibleMonth;

  bool _isPaging = false;
  bool _isResettingPage = false;

  @override
  void initState() {
    super.initState();
    _visibleMonth = DateTime(
      widget.currentMonth.year,
      widget.currentMonth.month,
    );
    _pageController = PageController(initialPage: _centerPage);
  }

  @override
  void didUpdateWidget(covariant QuestionCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final externalMonth = DateTime(
      widget.currentMonth.year,
      widget.currentMonth.month,
    );
    final oldExternalMonth = DateTime(
      oldWidget.currentMonth.year,
      oldWidget.currentMonth.month,
    );

    if (!_isSameMonth(oldExternalMonth, externalMonth) &&
        !_isSameMonth(_visibleMonth, externalMonth) &&
        !_isPaging) {
      _visibleMonth = externalMonth;

      if (_pageController.hasClients) {
        _isResettingPage = true;
        _pageController.jumpToPage(_centerPage);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _isResettingPage = false;
        });
      }
    }
  }

  bool _isSameMonth(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month;
  }

  DateTime _monthFromOffset(int offset) {
    return DateTime(_visibleMonth.year, _visibleMonth.month + offset);
  }

  double _calendarPageHeight(double contentWidth) {
    final rawCellWidth = (contentWidth - (_gridSpacing * 6)) / 7;
    final cellExtent = rawCellWidth.clamp(36.0, 56.0);
    return (cellExtent * 6) + (_gridSpacing * 5);
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth >= _tabletBreakpoint
            ? _maxCalendarWidth
            : constraints.maxWidth;
        final contentWidth = maxWidth - (_horizontalPadding * 2);
        final pageHeight = _calendarPageHeight(contentWidth);

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Container(
              clipBehavior: Clip.antiAlias,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CalendarHeader(
                      currentMonth: _visibleMonth,
                      onPrev: _goPrevMonth,
                      onNext: _goNextMonth,
                    ),

                    const SizedBox(height: 12),
                    const WeekdayRow(),
                    const SizedBox(height: 12),

                    ClipRect(
                      child: SizedBox(
                        height: pageHeight,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 3,
                          onPageChanged: (page) {
                            if (_isResettingPage || page == _centerPage) {
                              if (page == _centerPage && !_isResettingPage) {
                                _isPaging = false;
                              }
                              return;
                            }

                            final nextMonth = _monthFromOffset(page - _centerPage);

                            setState(() {
                              _visibleMonth = nextMonth;
                            });

                            widget.onMonthChanged(nextMonth);

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (!mounted || !_pageController.hasClients) return;

                              _isResettingPage = true;
                              _pageController.jumpToPage(_centerPage);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (!mounted) return;
                                _isResettingPage = false;
                                _isPaging = false;
                              });
                            });
                          },
                          itemBuilder: (_, page) {
                            final month = _monthFromOffset(page - _centerPage);

                            return CalendarGrid(
                              key: ValueKey('${month.year}-${month.month}'),
                              currentMonth: month,
                              questionDates: widget.questionDates,
                              onSelectDate: widget.onDateSelected,
                            );
                          },
                        ),
                      ),
                    ),

                    AnimatedQuestionPanel(
                      selectedDay: widget.selectedDay,
                      onQuestionTap: widget.onQuestionSelected,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
