import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:bounce_tapper/src/bounce_tapper.dart';

import 'package:eyelevel_kid/shared/theme/app_colors.dart';
import 'package:eyelevel_kid/shared/theme/app_theme.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onPressed;

  const SocialLoginButton({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.borderGray,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 12),
              Text(
                text,
                style: AppTheme.title16.copyWith(
                  color: AppColors.textDefault,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}