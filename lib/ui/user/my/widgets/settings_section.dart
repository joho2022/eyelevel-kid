import 'package:flutter/material.dart';

import 'package:bounce_tapper/bounce_tapper.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class SettingsSection extends StatelessWidget {
  final String? title;
  final List<({
  String title,
  Widget? trailing,
  VoidCallback? onTap,
  Color? textColor,
  })> items;

  const SettingsSection({
    super.key,
    this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            if (title != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title!,
                    style: AppTheme.title14.copyWith(
                      color: AppColors.textDefault,
                    ),
                  ),
                ),
              ),
              _divider(),
            ],

            ...List.generate(items.length, (index) {
              final item = items[index];
              final isLast = index == items.length - 1;

              return Column(
                children: [
                  BounceTapper(
                    onTap: item.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: AppTheme.title14.copyWith(
                                color: item.textColor ??
                                    AppColors.textDefault,
                              ),
                            ),
                          ),
                          if (item.trailing != null)
                            item.trailing!,
                        ],
                      ),
                    ),
                  ),
                  if (!isLast) _divider(),
                ],
              );
            }),
          ],
        ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        height: 1,
        color: AppColors.divider,
      ),
    );
  }
}