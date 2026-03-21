import 'dart:async';

import 'package:flutter/foundation.dart';
import '../../../domain/entities/question_record.dart';

import 'package:eyelevel_kid/ui/home/state/home_state.dart';

import '../../../domain/usecases/calendar/get_calendar_summary_use_case.dart';
import '../../../domain/usecases/calendar/get_questions_by_date_use_case.dart';
import '../../../domain/usecases/question/get_question_page_use_case.dart';
import '../../../domain/usecases/question/observe_all_questions_use_case.dart';
import '../../../domain/usecases/question/toggle_bookmark_use_case.dart';

class HomeViewModel extends ChangeNotifier {
  final ObserveAllQuestionsUseCase observeQuestionsUseCase;
  final GetQuestionPageUseCase getQuestionPageUseCase;
  final GetCalendarSummaryUseCase getCalendarSummaryUseCase;
  final GetQuestionsByDateUseCase getQuestionsByDateUseCase;
  final ToggleBookmarkUseCase toggleBookmarkUseCase;

  HomeState state = HomeState(
    currentMonth: DateTime(DateTime.now().year, DateTime.now().month),
  );

  StreamSubscription<List<QuestionRecord>>? _questionSubscription;
  Timer? _calendarDebounce;

  HomeViewModel({
    required this.observeQuestionsUseCase,
    required this.getQuestionPageUseCase,
    required this.getCalendarSummaryUseCase,
    required this.getQuestionsByDateUseCase,
    required this.toggleBookmarkUseCase,
  }) {
    _init();
  }

  // MARK: 초기화
  void _init() {
    _observeQuestions();
    _fetchInitialQuestions();
    _loadInitialCalendar();
  }

  // MARK: 질문 목록 구독
  void _observeQuestions() {
    state = state.copyWith(
      isRecentLoading: true,
      recentError: null,
    );
    notifyListeners();

    _questionSubscription = observeQuestionsUseCase().listen((questions) {
      final recentQuestions = questions.take(3).toList();

      state = state.copyWith(
        recentQuestions: recentQuestions,
        isRecentLoading: false,
      );

      notifyListeners();

      loadCalendarSummary(state.currentMonth, force: true);
    });
  }

  // MARK: 초기 질문 fetch
  Future<void> _fetchInitialQuestions() async {
    try {
      await getQuestionPageUseCase(limit: 3);
    } catch (_) {
      state = state.copyWith(
        recentError: "최근 질문을 불러오지 못했습니다",
        isRecentLoading: false,
      );
      notifyListeners();
    }
  }

  // MARK: 초기 달력 로드
  Future<void> _loadInitialCalendar() async {
    state = state.copyWith(isInitialLoading: true);
    notifyListeners();

    await loadCalendarSummary(state.currentMonth, force: true);

    state = state.copyWith(isInitialLoading: false);
    notifyListeners();
  }

  // MARK: 달력 월 변경 (debounce)
  Future<void> loadCalendarSummary(DateTime month, {bool force = false}) async {
    _calendarDebounce?.cancel();

    _calendarDebounce = Timer(const Duration(milliseconds: 300), () {
      _loadCalendarSummaryInternal(month, force: force);
    });
  }

  // MARK: 실제 달력 API 호출
  Future<void> _loadCalendarSummaryInternal(
      DateTime month, {
        bool force = false,
      }) async {
    if (!force &&
        month.year == state.currentMonth.year &&
        month.month == state.currentMonth.month) {
      return;
    }

    state = state.copyWith(
      isCalendarLoading: true,
      calendarError: null,
      currentMonth: month,
      selectedDay: null,
    );
    notifyListeners();

    try {
      final summary = await getCalendarSummaryUseCase(month.year, month.month);

      state = state.copyWith(questionDates: summary.questionDates);
    } catch (_) {
      state = state.copyWith(calendarError: "달력을 불러오지 못했습니다");
    } finally {
      state = state.copyWith(isCalendarLoading: false);
      notifyListeners();
    }
  }

  // MARK: 날짜 선택
  void selectDate(DateTime date) {
    if (state.isCalendarLoading) return;

    final hasQuestion = state.questionDates.any(
          (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );

    if (!hasQuestion) {
      state = state.copyWith(selectedDay: null);
      notifyListeners();
      return;
    }

    state = state.copyWith(isQuestionLoading: true, dayQuestionError: null);
    notifyListeners();

    _loadDaySummary(date);
  }

  // MARK: 날짜 질문 조회
  Future<void> _loadDaySummary(DateTime date) async {
    try {
      final daySummary = await getQuestionsByDateUseCase(
        date.year,
        date.month,
        date.day,
      );

      state = state.copyWith(selectedDay: daySummary);
    } catch (_) {
      state = state.copyWith(dayQuestionError: "질문을 불러오지 못했습니다");
    } finally {
      state = state.copyWith(isQuestionLoading: false);
      notifyListeners();
    }
  }

  // MARK: 북마크 토글
  Future<void> toggleBookmark(QuestionRecord question) async {
    try {
      await toggleBookmarkUseCase(question.id);
    } catch (_) {}
  }

  @override
  void dispose() {
    _calendarDebounce?.cancel();
    super.dispose();
  }
}