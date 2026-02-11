import 'package:flutter/material.dart';

import '../../../domain/values/answer_style.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';

class AnswerStyleSlider extends StatefulWidget {
  final AnswerStyle selected;
  final ValueChanged<AnswerStyle> onChanged;

  const AnswerStyleSlider({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<AnswerStyleSlider> createState() =>
      _AnswerStyleSliderState();
}

class _AnswerStyleSliderState
    extends State<AnswerStyleSlider>
    with SingleTickerProviderStateMixin {

  late double _currentValue;

  late final AnimationController _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selected.sliderValue;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() {
      if (_animation != null) {
        setState(() {
          _currentValue = _animation!.value;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnswerStyleSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentValue = widget.selected.sliderValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateTo(double target) {
    if ((_currentValue - target).abs() < 0.001) {
      widget.onChanged(
        AnswerStyleSliderMapper.fromSlider(target),
      );
      return;
    }

    _controller.stop();

    _animation = Tween<double>(
      begin: _currentValue,
      end: target,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward(from: 0).whenComplete(() {
      widget.onChanged(
        AnswerStyleSliderMapper.fromSlider(target),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isStory = _currentValue < 0.5;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '설명 스타일',
                  style: AppTheme.title18.copyWith(
                      color: AppColors.textDefault
                  ),
                ),

                Text(
                  '아이에게 어떻게 설명할까요?',
                  style: AppTheme.subtitle14.copyWith(
                      color: AppColors.textInfo
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10,
                activeTrackColor: AppColors.reasonSliderBackground,
                inactiveTrackColor: AppColors.storySliderBackground,
                overlayColor:
                (isStory ? AppColors.storySliderBackground : AppColors.reasonSliderBackground),
                thumbShape: _OutlineThumbShape(
                  borderColor: isStory
                      ? AppColors.storyPurple
                      : AppColors.reasonChipText,
                ),
              ),
              child: Slider(
                value: _currentValue,
                min: 0,
                max: 1,
                onChanged: (value) {
                  if (_controller.isAnimating) {
                    _controller.stop();
                  }

                  setState(() {
                    _currentValue = value;
                  });
                },
                onChangeEnd: (value) {
                  final targetStyle =
                  AnswerStyleSliderMapper.fromSlider(value);

                  _animateTo(targetStyle.sliderValue);
                },
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: AnswerStyle.values.map((style) {
                final isSelected =
                    style == AnswerStyleSliderMapper.fromSlider(_currentValue);

                final Color activeColor =
                style == AnswerStyle.story
                    ? AppColors.storyPurple
                    : AppColors.reasonChipText;

                return GestureDetector(
                  onTap: () => _animateTo(style.sliderValue),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: AppTheme.title14.copyWith(
                      color: isSelected
                          ? activeColor
                          : AppColors.textInfo,
                    ),
                    child: Text(style == .story ? '이야기처럼' : '이유까지'),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 2),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '재미있는 이야기로\n쉽게 설명해요',
                  style: AppTheme.subtitle10.copyWith(
                    color: AppColors.textInfo,
                  ),
                ),

                Text(
                  '원리와 이유를\n함께 알려줘요',
                  style: AppTheme.subtitle10.copyWith(
                    color: AppColors.textInfo,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _OutlineThumbShape extends SliderComponentShape {
  final double radius = 12;
  final Color borderColor;
  final double borderWidth = 5;

  const _OutlineThumbShape({
    required this.borderColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawCircle(center, radius, fillPaint);

    canvas.drawCircle(center, radius, borderPaint);
  }
}