import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/worksheet_table_cell.dart';
import 'manic/manic_type_diagnosis_page.dart';
import '../../application/diagnosis/states/selected_mood_condition_notifier.dart';
import '../../domain/mood_state.dart';
import '../../generated/l10n.dart';
import '../common/components/app_dividers.dart';
import '../common/components/async_value_handler.dart';
import '../common/components/buttons.dart';
import '../common/components/loading.dart';
import '../common/navigation/navigation_service.dart';
import '../common/theme/app_text_styles.dart';
import '../../utils/app_colors.dart';
import '../../utils/page_navigator.dart';
import '../../application/diagnosis/states/subscribe_mood_work_sheet_provider.dart';

/// 気分値目安表を表示するページ
class TablePage extends ConsumerWidget {
  const TablePage({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(subscribeMoodWorksheetProvider(uid)),
      loading: () => const OverlayLoading(),
      error: (p0, p1) => Scaffold(
        body: Center(
          child: Text(
            p0.toString(),
            style: AppTextStyles.body,
          ),
        ),
      ),
      builder: (worksheet) {
        final selectedMoodState =
            ref.watch(selectedMoodConditionNotifierProvider);

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
                actionText: worksheet.plus_5,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '+4',
                actionText: worksheet.plus_4,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '+3',
                actionText: worksheet.plus_3,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '+2',
                actionText: worksheet.plus_2,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '+1',
                actionText: worksheet.plus_1,
              ),
            ];
          } else {
            return [
              WorksheetTableCell(
                moodValue: '-1',
                actionText: worksheet.minus_1,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '-2',
                actionText: worksheet.minus_2,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '-3',
                actionText: worksheet.minus_3,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '-4',
                actionText: worksheet.minus_4,
              ),
              AppDividers.thick(color: AppColors.white),
              WorksheetTableCell(
                moodValue: '-5',
                actionText: worksheet.minus_5,
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
            title: Text(
              S.of(context).table,
              style: AppTextStyles.subheading,
            ),
            leading: IconButton(
              onPressed: () {
                PageNavigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
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
                          children: buildTableCells(
                              selectedMoodState == MoodState.manic),
                        ),
                      ),
                    ],
                  ),
                ),
                AppButtons.primary(
                  onPressed: () {
                    NavigationService.push(
                      context,
                      ManicTypeDiagnosisPage(uid: uid),
                    );
                  },
                  fixedSize: const Size(330, 60),
                  child: Text(
                    S.of(context).tableStartEdit,
                    style: AppTextStyles.buttonText,
                  ),
                ),
                const SizedBox(height: 80)
              ],
            ),
          ),
        );
      },
    );
  }
}
