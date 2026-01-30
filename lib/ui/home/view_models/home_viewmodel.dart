import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/home/state/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeState _state = HomeState.initial();
  HomeState get state => _state;

  Future<void> loadHome() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));

    _state = _state.copyWith(
      title: '오늘 아이는 무엇이 궁금했을까요?',
      subtitle: '질문은 아이의 생각이 자라는 흔적이에요',
      isLoading: false,
    );
    notifyListeners();
  }
}