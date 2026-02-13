import '../../domain/entities/question_page.dart';
import '../../domain/entities/question_record.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/values/answer_style.dart';
import '../dto/question_page_dto.dart';
import '../sources/local/question_local_data_source.dart';
import '../sources/mock/mock_question_remote_data_source.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final MockQuestionRemoteDataSource remote;
  final QuestionLocalDataSource local;

  QuestionRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<QuestionRecord> askQuestion({
    required String question,
    required AnswerStyle style,
  }) async {

    final answer = await remote.askQuestion(
      question: question,
      style: style,
    );

    final record = QuestionRecord(
      id: DateTime.now().millisecondsSinceEpoch,
      title: question,
      answer: answer,
      style: style,
      createdAt: DateTime.now(),
      isBookmarked: false,
    );

    local.upsertAll([record]);

    return record;
  }

  @override
  Future<QuestionPage> getPage({
    String? cursor,
    int limit = 20,
  }) async {
    final dto = await remote.fetchPage(
      cursor: cursor,
      limit: limit,
    );

    final page = dto.toEntity();

    if (cursor == null) {
      local.saveAll(page.items);
    } else {
      local.upsertAll(page.items);
    }

    return page;
  }

  @override
  Stream<List<QuestionRecord>> observeAll() {
    return local.observeAll();
  }

  @override
  List<QuestionRecord> getAllCached() {
    return local.getAll();
  }

  @override
  Future<QuestionRecord?> getById(int id) async {
    return local.getById(id);
  }

  @override
  Future<QuestionRecord> toggleBookmark(int questionId) async {
    local.toggleBookmark(questionId);
    return local.getById(questionId)!;
    // 나중에 서버 생기면 여기서 API 호출
  }

  @override
  Future<void> remove(int questionId) async {
    local.remove(questionId);
    // 나중에 서버 delete API
  }
}