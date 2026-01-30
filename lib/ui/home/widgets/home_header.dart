import 'package:flutter/material.dart';

import 'package:eyelevel_kid/ui/core/theme/app_colors.dart';
import 'package:eyelevel_kid/ui/core/theme/app_theme.dart';
import 'package:eyelevel_kid/ui/core/theme/app_images.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const HomeHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(AppImages.appLogo, height: 44),

            const SizedBox(width: 8),

            Text(
              '아이시선',
              style: AppTheme.title24.copyWith(
                color: AppColors.textDefault,
              ),
            ),

            const Spacer(),
          ],
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.cardGradientStart, AppColors.cardGradientEnd],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.homeInsightBulb,
                    width: 36,
                    height: 36,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTheme.title16.copyWith(
                        color: AppColors.textDefault,
                      ),
                    ),

                    Text(
                      subtitle,
                      style: AppTheme.subtitle14.copyWith(
                        color: AppColors.textSub,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
