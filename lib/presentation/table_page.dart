import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/mood_worksheet.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/mood_worksheet_repository.dart';
import 'package:mood_trend_flutter/presentation/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/components/loading.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';

import 'edit_dialog.dart';

enum MoodState {
  depression,
  manic,
}

final worksheetProvider = StreamProvider<MoodWorksheet>(
  (ref) => ref.watch(moodWorksheetRepositoryProvider).subscribe(),
);
final moodButtonStateProvider =
    StateProvider<MoodState>((_) => MoodState.manic);

class TablePage extends ConsumerWidget {
  const TablePage({super.key, required this.isEditMode});
  final bool isEditMode;

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
                          ref.read(moodButtonStateProvider.notifier).state =
                              MoodState.depression;
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ref.watch(moodButtonStateProvider) ==
                                        MoodState.depression
                                    ? AppColors.green
                                    : Colors.transparent)),
                        child: Text(
                          "鬱状態",
                          style: TextStyle(
                              color: ref.watch(moodButtonStateProvider) ==
                                      MoodState.depression
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 20),
                        )),
                    TextButton(
                        onPressed: () {
                          ref.read(moodButtonStateProvider.notifier).state =
                              MoodState.manic;
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ref.watch(moodButtonStateProvider) ==
                                        MoodState.manic
                                    ? AppColors.green
                                    : Colors.transparent)),
                        child: Text(
                          "躁状態",
                          style: TextStyle(
                              color: ref.watch(moodButtonStateProvider) ==
                                      MoodState.manic
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 20),
                        )),
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
                          color: AppColors.green.withOpacity(0.5),
                        ),
                        child: Column(
                            children: ref.watch(moodButtonStateProvider) ==
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
                                  ]),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: AppColors.white,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '気分値目安表を編集する',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
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
                child: Text(
                  actionText,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

MoodWorksheet updateMoodWorksheet(
    int moodValue, MoodWorksheet oldWorkSheet, String inputValue) {
  switch (moodValue) {
    case -5:
      return oldWorkSheet.copyWith(minus_5: inputValue);
    case -4:
      return oldWorkSheet.copyWith(minus_4: inputValue);
    case -3:
      return oldWorkSheet.copyWith(minus_3: inputValue);
    case -2:
      return oldWorkSheet.copyWith(minus_2: inputValue);
    case -1:
      return oldWorkSheet.copyWith(minus_1: inputValue);
    case 1:
      return oldWorkSheet.copyWith(plus_1: inputValue);
    case 2:
      return oldWorkSheet.copyWith(plus_2: inputValue);
    case 3:
      return oldWorkSheet.copyWith(plus_3: inputValue);
    case 4:
      return oldWorkSheet.copyWith(plus_4: inputValue);
    case 5:
      return oldWorkSheet.copyWith(plus_5: inputValue);
    default:
      return oldWorkSheet;
  }
}

String confirmMoodWorksheet(int moodValue, MoodWorksheet oldWorkSheet) {
  switch (moodValue) {
    case -5:
      return oldWorkSheet.minus_5;
    case -4:
      return oldWorkSheet.minus_4;
    case -3:
      return oldWorkSheet.minus_3;
    case -2:
      return oldWorkSheet.minus_2;
    case -1:
      return oldWorkSheet.minus_1;
    case 1:
      return oldWorkSheet.plus_1;
    case 2:
      return oldWorkSheet.plus_2;
    case 3:
      return oldWorkSheet.plus_3;
    case 4:
      return oldWorkSheet.plus_4;
    case 5:
      return oldWorkSheet.plus_5;
    default:
      return '';
  }
}
