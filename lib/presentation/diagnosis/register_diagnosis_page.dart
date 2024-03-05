// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/diagnosis/register_mood_worksheet_usecase.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/error_handler_mixin.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic/register_manic_entity_provider.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/table_page.dart';

import '../../utils/app_colors.dart';
import '../../utils/page_navigator.dart';
import 'components/worksheet_table_cell.dart';
import 'depression/register_depression_entity_provider.dart';

/// 選択された気分値目安表の状態を保持する [StateProvider]
final selectedMoodButtonStateProvider = StateProvider<MoodState>(
  (_) => MoodState.manic,
);
int popCount = 0;

/// 気分値目安表登録画面
class RegisterDiagnosisPage extends ConsumerWidget with ErrorHandlerMixin {
  const RegisterDiagnosisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 登録用のエンティティを取得
    // 取得ロジックは StateProvider 内に隠蔽されている
    final registerManicWorksheet = ref.watch(
      registerManicEntityProvider,
    );
    final registerDepressionWorksheet = ref.watch(
      registerDepressionEntityProvider,
    );

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
                TextButton(
                  onPressed: () {
                    ref.read(selectedMoodButtonStateProvider.notifier).update(
                          (_) => MoodState.manic,
                        );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ref.watch(selectedMoodButtonStateProvider) ==
                              MoodState.manic
                          ? AppColors.green
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    S.of(context).manic,
                    style: TextStyle(
                      color: ref.watch(selectedMoodButtonStateProvider) ==
                              MoodState.manic
                          ? AppColors.white
                          : AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(selectedMoodButtonStateProvider.notifier).update(
                          (_) => MoodState.depression,
                        );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ref.watch(selectedMoodButtonStateProvider) ==
                                  MoodState.depression
                              ? AppColors.green
                              : Colors.transparent)),
                  child: Text(
                    S.of(context).depression,
                    style: TextStyle(
                        color: ref.watch(selectedMoodButtonStateProvider) ==
                                MoodState.depression
                            ? AppColors.white
                            : AppColors.black,
                        fontSize: 20),
                  ),
                ),
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
                      color: AppColors.green.withOpacity(0.4),
                    ),
                    child: Column(
                      children: ref.watch(selectedMoodButtonStateProvider) ==
                              MoodState.manic
                          ? [
                              WorksheetTableCell(
                                moodValue: '+5',
                                actionText: registerManicWorksheet.plus_5,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '+4',
                                actionText: registerManicWorksheet.plus_4,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '+3',
                                actionText: registerManicWorksheet.plus_3,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '+2',
                                actionText: registerManicWorksheet.plus_2,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '+1',
                                actionText: registerManicWorksheet.plus_1,
                              ),
                            ]
                          : [
                              WorksheetTableCell(
                                moodValue: '-1',
                                actionText: registerDepressionWorksheet.minus_1,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '-2',
                                actionText: registerDepressionWorksheet.minus_2,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '-3',
                                actionText: registerDepressionWorksheet.minus_3,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '-4',
                                actionText: registerDepressionWorksheet.minus_4,
                              ),
                              Divider(
                                height: 0,
                                thickness: 2,
                                indent: 16,
                                endIndent: 16,
                                color: AppColors.white,
                              ),
                              WorksheetTableCell(
                                moodValue: '-5',
                                actionText: registerDepressionWorksheet.minus_5,
                              ),
                            ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
                fixedSize: const Size(330, 60),
              ),
              onPressed: () async {
                await run(ref, action: () async {
                  await ref.read(registerMoodWorksheetUsecaseProvider).execute(
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
                  int count = 0;
                  await PageNavigator.popUntil(
                    context,
                    predicate: (_) => count++ >= popCount,
                  );
                  popCount = 0;
                }, successMessage: S.of(context).registerSave);
              },
              child: Text(
                S.of(context).registerRegister,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
