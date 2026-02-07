import '../../domain/entities/question_record.dart';
import '../../domain/repositories/question_repository.dart';
import '../dto/question_record_dto.dart';
import '../sources/mock/mock_question_remote_data_source.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final MockQuestionRemoteDataSource mockSource;

  QuestionRepositoryImpl(this.mockSource);

  @override
  Future<List<QuestionRecord>> fetchRecentQuestions() async {
    final dtos = await mockSource.fetchAll();

    return dtos
        .map((e) => e.toEntity())
        .take(3)
        .toList();
  }
}