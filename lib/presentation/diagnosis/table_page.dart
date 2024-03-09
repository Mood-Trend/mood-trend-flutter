import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/register_diagnosis_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';

import '../../application/diagnosis/states/subscribe_mood_work_sheet_provider.dart';
import '../../utils/page_navigator.dart';
import 'components/worksheet_table_cell.dart';
import 'manic/manic_type_diagnosis_page.dart';

/// [MoodState] は、気分値目安表の状態を表す
enum MoodState {
  // 鬱状態
  depression,
  // 躁状態
  manic,
}

/// 選択された気分値目安表の状態を保持する [StateProvider]
final selectedMoodButtonStateProvider = StateProvider<MoodState>(
  (_) => MoodState.manic,
);

/// 気分値目安表を表示するページ
class TablePage extends ConsumerWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(subscribeMoodWorksheetProvider),
      loading: () => const OverlayLoading(),
      error: (p0, p1) => Scaffold(
        body: Center(
          child: Text(
            p0.toString(),
          ),
        ),
      ),
      builder: (worksheet) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              S.of(context).table,
              style: const TextStyle(fontSize: 20),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
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
                    TextButton(
                      onPressed: () {
                        ref
                            .read(selectedMoodButtonStateProvider.notifier)
                            .update(
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
                        ref
                            .read(selectedMoodButtonStateProvider.notifier)
                            .update(
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
                          children:
                              ref.watch(selectedMoodButtonStateProvider) ==
                                      MoodState.manic
                                  ? [
                                      WorksheetTableCell(
                                        moodValue: '+5',
                                        actionText: worksheet.plus_5,
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
                                        actionText: worksheet.plus_4,
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
                                        actionText: worksheet.plus_3,
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
                                        actionText: worksheet.plus_2,
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
                                        actionText: worksheet.plus_1,
                                      ),
                                    ]
                                  : [
                                      WorksheetTableCell(
                                        moodValue: '-1',
                                        actionText: worksheet.minus_1,
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
                                        actionText: worksheet.minus_2,
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
                                        actionText: worksheet.minus_3,
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
                                        actionText: worksheet.minus_4,
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
                                        actionText: worksheet.minus_5,
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
                  onPressed: () {
                    popCount++;
                    PageNavigator.push(context, const ManicTypeDiagnosisPage());
                  },
                  child: Text(
                    S.of(context).tableStartEdit,
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
      },
    );
  }
}
