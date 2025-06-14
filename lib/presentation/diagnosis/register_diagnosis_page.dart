// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'depression/register_depression_entity_notifier.dart';
import 'manic/register_manic_entity_notifier.dart';
import 'components/worksheet_table_cell.dart';
import '../../application/diagnosis/register_mood_worksheet_usecase.dart';
import '../../application/diagnosis/states/selected_mood_condition_notifier.dart';
import '../../domain/mood_state.dart';
import '../../../generated/l10n.dart';
import '../common/components/app_dividers.dart';
import '../common/components/buttons.dart';
import '../common/error_handler_mixin.dart';
import '../common/navigation/navigation_service.dart';
import '../common/theme/app_text_styles.dart';
import '../../utils/app_colors.dart';

/// 気分値目安表登録画面
class RegisterDiagnosisPage extends ConsumerWidget with ErrorHandlerMixin {
  const RegisterDiagnosisPage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 登録用のエンティティを取得
    // 取得ロジックは NotifierProvider 内に隠蔽されている
    final registerManicWorksheet =
        ref.watch(registerManicEntityNotifierProvider);
    final registerDepressionWorksheet =
        ref.watch(registerDepressionEntityNotifierProvider);
    final selectedMoodState = ref.watch(selectedMoodConditionNotifierProvider);

    // 気分状態切り替えボタンを作成
    Widget buildMoodStateButton(MoodState state, String label) {
      return AppButtons.secondary(
        onPressed: () {
          ref
              .read(selectedMoodConditionNotifierProvider.notifier)
              .select(state);
        },
        isSelected: selectedMoodState == state,
        child: Text(label),
      );
    }

    // 気分値テーブルのセルとディバイダーを作成
    List<Widget> buildTableCells(bool isManic) {
      if (isManic) {
        return [
          WorksheetTableCell(
            moodValue: '+5',
            actionText: registerManicWorksheet.plus_5,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '+4',
            actionText: registerManicWorksheet.plus_4,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '+3',
            actionText: registerManicWorksheet.plus_3,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '+2',
            actionText: registerManicWorksheet.plus_2,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '+1',
            actionText: registerManicWorksheet.plus_1,
          ),
        ];
      } else {
        return [
          WorksheetTableCell(
            moodValue: '-1',
            actionText: registerDepressionWorksheet.minus_1,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '-2',
            actionText: registerDepressionWorksheet.minus_2,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '-3',
            actionText: registerDepressionWorksheet.minus_3,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '-4',
            actionText: registerDepressionWorksheet.minus_4,
          ),
          AppDividers.thick(color: AppColors.white),
          WorksheetTableCell(
            moodValue: '-5',
            actionText: registerDepressionWorksheet.minus_5,
          ),
        ];
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(S.of(context).registerConfirm),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMoodStateButton(MoodState.manic, S.of(context).manic),
                buildMoodStateButton(
                    MoodState.depression, S.of(context).depression),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.green.withValues(alpha: 0.4),
                    ),
                    child: Column(
                      children:
                          buildTableCells(selectedMoodState == MoodState.manic),
                    ),
                  ),
                ],
              ),
            ),
            AppButtons.primary(
              onPressed: () async {
                await run(ref, action: () async {
                  await ref
                      .read(registerMoodWorksheetUsecaseProvider(uid))
                      .execute(
                        minus_5: registerDepressionWorksheet.minus_5,
                        minus_4: registerDepressionWorksheet.minus_4,
                        minus_3: registerDepressionWorksheet.minus_3,
                        minus_2: registerDepressionWorksheet.minus_2,
                        minus_1: registerDepressionWorksheet.minus_1,
                        plus_1: registerManicWorksheet.plus_1,
                        plus_2: registerManicWorksheet.plus_2,
                        plus_3: registerManicWorksheet.plus_3,
                        plus_4: registerManicWorksheet.plus_4,
                        plus_5: registerManicWorksheet.plus_5,
                      );

                  // ナビゲーション深度に基づいて画面を戻る
                  await NavigationService.popTimes(
                    context,
                    count: 6,
                  );
                }, successMessage: S.of(context).registerSave);
              },
              fixedSize: const Size(330, 60),
              child: Text(
                S.of(context).registerRegister,
                style: AppTextStyles.buttonText,
              ),
            ),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
