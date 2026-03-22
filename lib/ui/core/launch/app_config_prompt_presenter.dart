import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/app_config_dialog.dart';
import 'launch_gate_factory.dart';
import 'launch_gate_viewmodel.dart';

class AppConfigPromptPresenter {
  static bool _isPresenting = false;
  static bool _presentedThisSession = false;

  static Future<void> present(BuildContext context) async {
    if (_isPresenting || _presentedThisSession) {
      return;
    }

    _isPresenting = true;

    final viewModel = createLaunchGateViewModel();

    try {
      await viewModel.initialize();

      if (!context.mounted || !viewModel.hasPromptToShow) {
        _presentedThisSession = viewModel.hasCheckedThisSession;
        return;
      }

      while (context.mounted && viewModel.currentPrompt != null) {
        await _showPrompt(
          context: context,
          viewModel: viewModel,
          prompt: viewModel.currentPrompt!,
        );
      }

      _presentedThisSession = true;
    } finally {
      viewModel.dispose();
      _isPresenting = false;
    }
  }

  static Future<void> _showPrompt({
    required BuildContext context,
    required LaunchGateViewModel viewModel,
    required LaunchPrompt prompt,
  }) async {
    final dismissedByBarrier = await showDialog<bool>(
      context: context,
      barrierDismissible: !prompt.blocking,
      builder: (dialogContext) {
        Widget dialog = AppConfigDialog(
          title: prompt.title,
          body: prompt.body,
          confirmText: prompt.type == LaunchPromptType.notice ? '확인' : '업데이트',
          cancelText: prompt.type == LaunchPromptType.optionalUpdate
              ? '나중에'
              : null,
          secondaryText:
              prompt.type == LaunchPromptType.notice && !prompt.blocking
              ? '오늘 하루 보지 않기'
              : null,
          barrierDismissible: !prompt.blocking,
          onConfirm: () async {
            if (prompt.type == LaunchPromptType.notice) {
              if (dialogContext.mounted) {
                Navigator.of(dialogContext).pop(false);
              }
              viewModel.dismissCurrentPrompt();
              return;
            }

            await _launchStore(viewModel.storeUrl);

            if (prompt.type == LaunchPromptType.optionalUpdate &&
                dialogContext.mounted) {
              Navigator.of(dialogContext).pop(false);
              viewModel.dismissCurrentPrompt();
            }
          },
          onCancel: prompt.type == LaunchPromptType.optionalUpdate
              ? () {
                  Navigator.of(dialogContext).pop(false);
                  viewModel.dismissCurrentPrompt();
                }
              : null,
          onSecondary:
              prompt.type == LaunchPromptType.notice && !prompt.blocking
              ? () async {
                  if (dialogContext.mounted) {
                    Navigator.of(dialogContext).pop(false);
                  }
                  await viewModel.dismissNoticeForToday();
                }
              : null,
        );

        if (prompt.blocking) {
          dialog = PopScope(canPop: false, child: dialog);
        }

        return dialog;
      },
    );

    if (dismissedByBarrier == null && !prompt.blocking) {
      viewModel.dismissCurrentPrompt();
    }
  }

  static Future<void> _launchStore(String storeUrl) async {
    await launchUrl(Uri.parse(storeUrl), mode: LaunchMode.externalApplication);
  }
}
