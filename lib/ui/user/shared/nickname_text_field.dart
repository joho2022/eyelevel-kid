import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';

class NicknameTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String? errorText;

  const NicknameTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  @override
  State<NicknameTextField> createState() => _NicknameTextFieldState();
}

class _NicknameTextFieldState extends State<NicknameTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant NicknameTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(
          offset: widget.value.length,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasError
                  ? Colors.red
                  : AppColors.borderGray,
            ),
          ),
          child: TextField(
            controller: _controller,
            maxLength: 8,
            style: AppTheme.subtitle16.copyWith(
              color: AppColors.textDefault,
            ),
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: '닉네임을 입력해주세요 (2~8자)',
              hintStyle: AppTheme.subtitle16.copyWith(
                color: AppColors.textInfo,
              ),
            ),
            onChanged: widget.onChanged,
          ),
        ),

        const SizedBox(height: 6),

        if (widget.errorText != null)
          Text(
            widget.errorText!,
            style: AppTheme.label12.copyWith(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}