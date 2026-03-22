import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/question/ask/state/ask_question_state.dart';
import 'package:eyelevel_kid/ui/question/ask/ask_factory.dart';
import 'package:eyelevel_kid/ui/question/ask/view_models/ask_question_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/routes/route_paths.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_background.dart';
import '../../core/widgets/answer_style_slider.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => createAskQuestionViewModel(),
      child: const _AskQuestionView(),
    );
  }
}

class _AskQuestionView extends StatelessWidget {
  const _AskQuestionView();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AskQuestionViewModel>();
    final state = viewModel.state;

    Color _buttonColor(AskQuestionState state) {
      if (state.isLoading) {
        return AppColors.storyPurple.withValues(alpha: 0.5);
      }

      if (!state.canSubmit) {
        return AppColors.disabledGray;
      }

      return AppColors.storyPurple;
    }

    return PopScope(
      canPop: !state.isLoading,
      child: AppBackground(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: true,

              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                scrolledUnderElevation: 0,
                leading: BackButton(color: AppColors.storyPurple),
              ),

              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 150,
                              child: TextField(
                                cursorColor: AppColors.storyPurple,
                                maxLines: null,
                                expands: true,
                                maxLength: 200,
                                style: AppTheme.subtitle16.copyWith(
                                  color: AppColors.textDefault,
                                ),
                                decoration: InputDecoration(
                                  hintText: '아이에게 설명할 내용을 적어주세요',
                                  hintStyle: AppTheme.subtitle16.copyWith(
                                    color: AppColors.textInfo,
                                  ),
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                                onChanged: viewModel.updateQuestion,
                              ),
                            ),

                            Text(
                              '${state.question.length}/200',
                              style: AppTheme.subtitle12.copyWith(
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      AnswerStyleSlider(
                        selected: state.style,
                        onChanged: viewModel.updateStyle,
                      ),
                    ],
                  ),
                ),
              ),

              bottomNavigationBar: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    12,
                    20,
                    MediaQuery.of(context).viewInsets.bottom + 12,
                  ),
                  child: SizedBox(
                    height: 52,
                    child: BounceTapper(
                      onTap: state.isLoading
                          ? null
                          : () async {
                        final record = await viewModel.submit();

                        if (record != null && context.mounted) {
                          context.replace(
                            RoutePaths.questionDetailPath(record.id),
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: _buttonColor(state),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '질문하기',
                          style: AppTheme.title14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

              if (state.isLoading)
                Container(
                  color: Colors.black.withValues(alpha: 0.15),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
