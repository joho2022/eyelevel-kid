import 'dart:async';

import '../../../domain/entities/question_record.dart';

class QuestionLocalDataSource {
  final List<QuestionRecord> _cache = [];
  final _controller = StreamController<List<QuestionRecord>>.broadcast();

  Stream<List<QuestionRecord>> observeAll() async* {
    yield getAll();
    yield* _controller.stream;
  }

  List<QuestionRecord> getAll() => List.unmodifiable(_cache);

  // MARK: - 전체 저장
  void saveAll(List<QuestionRecord> items) {
    _cache
      ..clear()
      ..addAll(items);

    _controller.add(getAll());
  }

  // MARK: - 질문 생성
  void insert(QuestionRecord item) {
    _cache.insert(0, item);

    _controller.add(getAll());
  }

  // MARK: - 페이지 추가
  void insertAll(List<QuestionRecord> items) {
    for (final item in items) {
      final index = _cache.indexWhere((e) => e.id == item.id);

      if (index == -1) {
        _cache.add(item);
      } else {
        _cache[index] = item;
      }
    }

    _controller.add(getAll());
  }

  // MARK: - 질문 업데이트 (북마크 등)
  void update(QuestionRecord item) {
    final index = _cache.indexWhere((e) => e.id == item.id);

    if (index == -1) return;

    _cache[index] = item;

    _controller.add(getAll());
  }

  // MARK: - 단일 조회
  QuestionRecord? getById(int id) {
    try {
      return _cache.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  // MARK: - 삭제
  void remove(int id) {
    _cache.removeWhere((e) => e.id == id);

    _controller.add(getAll());
  }
}