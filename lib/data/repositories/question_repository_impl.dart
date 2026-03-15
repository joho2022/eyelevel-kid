import 'package:flutter/foundation.dart';

import '../../domain/entities/question_page.dart';
import '../../domain/entities/question_record.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/values/answer_style.dart';
import '../dto/question/response/question_page_response_dto.dart';
import '../dto/question/response/question_response_dto.dart';
import '../sources/local/question_local_data_source.dart';
import '../sources/remote/question_remote_data_source.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource remote;
  final QuestionLocalDataSource local;

  QuestionRepositoryImpl({required this.remote, required this.local});

  // MARK: - 질문 생성
  @override
  Future<QuestionRecord> askQuestion({
    required String question,
    required AnswerStyle style,
  }) async {
    final dto = await remote.askQuestion(question: question, style: style);

    final record = dto.toDomain();

    local.insert(record);

    return record;
  }

  // MARK: - 질문 페이지 조회
  @override
  Future<QuestionPage> fetchQuestionPage({
    String? cursor,
    int limit = 20,
  }) async {
    final dto = await remote.fetchPage(cursor: cursor, limit: limit);


    if (kDebugMode) {
      print("==== server items ====");
      print(dto.items.length);
    }

    final page = dto.toDomain();

    local.insertAll(page.items);

    return page;
  }

  // MARK: - 질문 목록 관찰
  @override
  Stream<List<QuestionRecord>> observeQuestions() {
    return local.observeAll();
  }

  // MARK: - 단일 질문 조회
  @override
  Future<QuestionRecord> getById(int id) async {
    final localItem = local.getById(id);

    if (localItem != null) {
      return localItem;
    }

    final dto = await remote.getQuestion(id);

    final record = dto.toDomain();

    local.insert(record);

    return record;
  }

  // MARK: - 북마크 토글
  @override
  Future<QuestionRecord> toggleBookmark(int questionId) async {
    final dto = await remote.toggleBookmark(questionId);

    final updated = dto.toDomain();

    local.update(updated);

    return updated;
  }

  // MARK: - 질문 삭제
  @override
  Future<void> deleteQuestion(int questionId) async {
    await remote.deleteQuestion(questionId);

    local.remove(questionId);
  }
}
