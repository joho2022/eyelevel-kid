enum AnswerStyle {
  story,
  reason
}

extension AnswerStyleSliderMapper on AnswerStyle {
  double get sliderValue {
    switch (this) {
      case AnswerStyle.story:
        return 0.0;
      case AnswerStyle.reason:
        return 1.0;
    }
  }

  static AnswerStyle fromSlider(double value) {
    return value < 0.5
        ? AnswerStyle.story
        : AnswerStyle.reason;
  }
}