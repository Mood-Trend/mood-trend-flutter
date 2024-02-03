import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic_type_diagnosis.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';

import '../../application/diagnosis/states/subscribe_mood_work_sheet_provider.dart';
import '../../utils/page_navigator.dart';

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

class TablePage extends ConsumerWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(worksheetProvider),
      loading: () => const OverlayLoading(),
      builder: (worksheet) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("気分値目安表"),
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
                          "鬱状態",
                          style: TextStyle(
                              color:
                                  ref.watch(selectedMoodButtonStateProvider) ==
                                          MoodState.depression
                                      ? AppColors.white
                                      : AppColors.black,
                              fontSize: 20),
                        )),
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
                        "躁状態",
                        style: TextStyle(
                          color: ref.watch(selectedMoodButtonStateProvider) ==
                                  MoodState.manic
                              ? AppColors.white
                              : AppColors.black,
                          fontSize: 20,
                        ),
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
                                      TableCell(
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
                                      TableCell(
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
                                      TableCell(
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
                                      TableCell(
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
                                      TableCell(
                                        moodValue: '+1',
                                        actionText: worksheet.plus_1,
                                      ),
                                    ]
                                  : [
                                      TableCell(
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
                                      TableCell(
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
                                      TableCell(
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
                                      TableCell(
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
                                      TableCell(
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
                    PageNavigator.push(context, const ManicTypeDiagnosis());
                  },
                  child: const Text(
                    '気分値目安表の設定をはじめる',
                    style: TextStyle(
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

class TableCell extends StatelessWidget {
  const TableCell({
    super.key,
    required this.moodValue,
    required this.actionText,
  });
  final String moodValue;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            moodValue,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          child: SizedBox(
            // これがないと文字数が多い時にUIが崩れる
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.left,
                        actionText,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
