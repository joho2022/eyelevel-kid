import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:eyelevel_kid/ui/question/ask/view_models/ask_question_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../domain/usecases/ask_question_use_case.dart';
import '../../core/routes/route_paths.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/answer_style_slider.dart';

class AskQuestionScreen extends StatelessWidget {
  const AskQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final askQuestionUseCase = context.read<AskQuestionUseCase>();

    return ChangeNotifierProvider(
      create: (_) =>
          AskQuestionViewModel(askQuestionUseCase: askQuestionUseCase),
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
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

      bottomNavigationBar: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 12,
        ),
        child: SafeArea(
          top: false,
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
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: state.isLoading
                      ? AppColors.storyPurple.withValues(alpha: 0.4)
                      : AppColors.storyPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: state.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        '질문하기',
                        style: AppTheme.title14.copyWith(color: Colors.white),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
