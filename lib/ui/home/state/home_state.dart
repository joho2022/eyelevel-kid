class HomeState {
  final String title;
  final String subtitle;
  final bool isLoading;

  const HomeState({
    required this.title,
    required this.subtitle,
    required this.isLoading,
  });

  factory HomeState.initial() {
    return const HomeState(
      title: '',
      subtitle: '',
      isLoading: true,
    );
  }

  HomeState copyWith({
    String? title,
    String? subtitle,
    bool? isLoading,
  }) {
    return HomeState(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}