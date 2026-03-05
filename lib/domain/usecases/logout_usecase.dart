import '../repositories/token_repository.dart';

class LogoutUseCase {
  final TokenRepository tokenRepository;

  LogoutUseCase(this.tokenRepository);

  Future<void> call() async {
    await tokenRepository.clear();
  }
}
