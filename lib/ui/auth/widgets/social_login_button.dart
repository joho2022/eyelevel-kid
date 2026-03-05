import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:bounce_tapper/bounce_tapper.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BounceTapper(
      onTap: isLoading ? null : onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderGray, width: 2),
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.grey,
                    ),
                  )
                : Row(
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
      ),
    );
  }
}
