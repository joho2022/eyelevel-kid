import '../../entities/app_config.dart';
import '../../repositories/app_config_repository.dart';

class FetchAppConfigUseCase {
  final AppConfigRepository repository;

  FetchAppConfigUseCase(this.repository);

  Future<AppConfig> call() {
    return repository.fetchAppConfig();
  }
}