import '../../domain/entities/app_config.dart';
import '../../domain/repositories/app_config_repository.dart';
import '../dto/app_config/response/app_config_response_dto.dart';
import '../sources/remote/app_config_remote_data_source.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final AppConfigRemoteDataSource remote;

  AppConfigRepositoryImpl({
    required this.remote,
  });

  @override
  Future<AppConfig> fetchAppConfig() async {
    final dto = await remote.fetchAppConfig();
    return dto.toDomain();
  }
}