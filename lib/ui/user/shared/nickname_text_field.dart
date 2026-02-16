import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class NicknameTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
              color: errorText == null
                  ? AppColors.borderGray
                  : Colors.red,
            ),
          ),
          child: TextField(
            controller: TextEditingController(text: value)
              ..selection = TextSelection.collapsed(
                offset: value.length,
              ),
            maxLength: 8,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: '닉네임을 입력해주세요',
            ),
            onChanged: onChanged,
          ),
        ),

        const SizedBox(height: 6),

        if (errorText != null)
          Text(
            errorText!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}