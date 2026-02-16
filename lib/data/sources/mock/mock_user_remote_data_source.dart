class MockUserRemoteDataSource {
  Future<void> saveNickname(String nickname) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}