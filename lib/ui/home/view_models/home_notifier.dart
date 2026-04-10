import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/service_locator.dart';
import '../../../domain/entities/question_record.dart';
import '../../../domain/usecases/calendar/get_calendar_summary_use_case.dart';
import '../../../domain/usecases/calendar/get_questions_by_date_use_case.dart';
import '../../../domain/usecases/question/get_question_page_use_case.dart';
import '../../../domain/usecases/question/observe_all_questions_use_case.dart';
import '../../../domain/usecases/question/toggle_bookmark_use_case.dart';
import '../state/home_state.dart';

final homeNotifierProvider = NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);

class HomeNotifier extends Notifier<HomeState> {
  late final ObserveAllQuestionsUseCase _observeQuestionsUseCase;
  late final GetQuestionPageUseCase _getQuestionPageUseCase;
  late final GetCalendarSummaryUseCase _getCalendarSummaryUseCase;
  late final GetQuestionsByDateUseCase _getQuestionsByDateUseCase;
  late final ToggleBookmarkUseCase _toggleBookmarkUseCase;

  StreamSubscription<List<QuestionRecord>>? _questionSubscription;
  Timer? _calendarDebounce;
  bool _initialized = false;

  // MARK: - Build
  @override
  HomeState build() {
    _observeQuestionsUseCase = serviceLocator<ObserveAllQuestionsUseCase>();
    _getQuestionPageUseCase = serviceLocator<GetQuestionPageUseCase>();
    _getCalendarSummaryUseCase = serviceLocator<GetCalendarSummaryUseCase>();
    _getQuestionsByDateUseCase = serviceLocator<GetQuestionsByDateUseCase>();
    _toggleBookmarkUseCase = serviceLocator<ToggleBookmarkUseCase>();

    ref.onDispose(() {
      _questionSubscription?.cancel();
      _calendarDebounce?.cancel();
    });

    if (!_initialized) {
      _initialized = true;
      Future.microtask(_init);
    }

    return HomeState(
      currentMonth: DateTime(DateTime.now().year, DateTime.now().month),
      isInitialLoading: true,
      isRecentLoading: true,
    );
  }

  // MARK: - 초기화
  void _init() {
    _observeQuestions();
    _fetchInitialQuestions();
    _loadInitialCalendar();
  }

  // MARK: - 질문 목록 구독
  void _observeQuestions() {
    state = state.copyWith(recentError: null);

    _questionSubscription = _observeQuestionsUseCase().listen((questions) {
      final recentQuestions = questions.take(3).toList();

      state = state.copyWith(
        recentQuestions: recentQuestions,
        isRecentLoading: false,
      );

      loadCalendarSummary(state.currentMonth, force: true);
    });
  }

  // MARK: - 초기 질문 fetch
  Future<void> _fetchInitialQuestions() async {
    try {
      await _getQuestionPageUseCase(limit: 3);
    } catch (_) {
      state = state.copyWith(
        recentError: '최근 질문을 불러오지 못했습니다',
        isRecentLoading: false,
      );
    }
  }

  // MARK: - 초기 달력 로드
  Future<void> _loadInitialCalendar() async {
    await _loadCalendarSummaryInternal(state.currentMonth, force: true);

    state = state.copyWith(isInitialLoading: false);
  }

  // MARK: - 달력 월 변경
  Future<void> loadCalendarSummary(DateTime month, {bool force = false}) async {
    _calendarDebounce?.cancel();

    _calendarDebounce = Timer(const Duration(milliseconds: 300), () {
      _loadCalendarSummaryInternal(month, force: force);
    });
  }

  // MARK: - 실제 달력 API 호출
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

    try {
      final summary = await _getCalendarSummaryUseCase(month.year, month.month);

      state = state.copyWith(questionDates: summary.questionDates);
    } catch (_) {
      state = state.copyWith(calendarError: '달력을 불러오지 못했습니다');
    } finally {
      state = state.copyWith(isCalendarLoading: false);
    }
  }

  // MARK: - 날짜 선택
  void selectDate(DateTime date) {
    if (state.isCalendarLoading) return;

    final hasQuestion = state.questionDates.any(
      (d) => d.year == date.year && d.month == date.month && d.day == date.day,
    );

    if (!hasQuestion) {
      state = state.copyWith(selectedDay: null);
      return;
    }

    state = state.copyWith(isQuestionLoading: true, dayQuestionError: null);
    _loadDaySummary(date);
  }

  // MARK: - 날짜 질문 조회
  Future<void> _loadDaySummary(DateTime date) async {
    try {
      final daySummary = await _getQuestionsByDateUseCase(
        date.year,
        date.month,
        date.day,
      );

      state = state.copyWith(selectedDay: daySummary);
    } catch (_) {
      state = state.copyWith(dayQuestionError: '질문을 불러오지 못했습니다');
    } finally {
      state = state.copyWith(isQuestionLoading: false);
    }
  }

  // MARK: - 북마크 토글
  Future<void> toggleBookmark(QuestionRecord question) async {
    try {
      await _toggleBookmarkUseCase(question.id);
    } catch (_) {}
  }
}
