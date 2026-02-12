import 'dart:async';

import '../../../domain/entities/question_record.dart';

class QuestionLocalDataSource {
  final List<QuestionRecord> _cache = [];
  final _controller = StreamController<List<QuestionRecord>>.broadcast();

  Stream<List<QuestionRecord>> observeAll() => _controller.stream;

  List<QuestionRecord> getAll() => List.unmodifiable(_cache);

  void saveAll(List<QuestionRecord> items) {
    _cache
      ..clear()
      ..addAll(items);
    _controller.add(getAll());
  }

  void upsertAll(List<QuestionRecord> items) {
    for (final item in items) {
      _cache.removeWhere((e) => e.id == item.id);
      _cache.add(item);
    }
    _controller.add(getAll());
  }

  QuestionRecord? getById(int id) {
    try {
      return _cache.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  void toggleBookmark(int id) {
    final index = _cache.indexWhere((e) => e.id == id);
    if (index == -1) return;

    final q = _cache[index];
    _cache[index] = QuestionRecord(
      id: q.id,
      title: q.title,
      answer: q.answer,
      style: q.style,
      createdAt: q.createdAt,
      isBookmarked: !q.isBookmarked,
    );

    _controller.add(getAll());
  }

  void remove(int id) {
    _cache.removeWhere((e) => e.id == id);
    _controller.add(getAll());
  }
}