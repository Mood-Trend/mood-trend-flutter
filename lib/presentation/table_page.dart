import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/mood_worksheet.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/mood_worksheet_repository.dart';
import 'package:mood_trend_flutter/presentation/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/components/loading.dart';

import 'edit_dialog.dart';

final worksheetProvider = StreamProvider<MoodWorksheet>(
  (ref) => ref.watch(moodWorksheetRepositoryProvider).subscribe(),
);

class TablePage extends ConsumerWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return AsyncValueHandler(
      value: ref.watch(worksheetProvider),
      loading: () => const OverlayLoading(),
      builder: (worksheet) {
        return Scaffold(
          backgroundColor: colors.surfaceVariant,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text("症状ワークシート"),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: colors.primary,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const EditDialog();
                },
              );
            },
            child: Icon(
              Icons.mode_edit,
              color: colors.onPrimary,
            ),
          ),
          body: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TableCard(
                  moodValue: "+5",
                  actionText: worksheet.plus_5,
                ),
                TableCard(
                  moodValue: "+4",
                  actionText: worksheet.plus_4,
                ),
                TableCard(
                  moodValue: "+3",
                  actionText: worksheet.plus_3,
                ),
                TableCard(
                  moodValue: "+2",
                  actionText: worksheet.plus_2,
                ),
                TableCard(
                  moodValue: "+1",
                  actionText: worksheet.plus_1,
                ),
                const SizedBox(
                  height: 30,
                ),
                TableCard(
                  moodValue: "-1",
                  actionText: worksheet.minus_1,
                ),
                TableCard(
                  moodValue: "-2",
                  actionText: worksheet.minus_2,
                ),
                TableCard(
                  moodValue: "-3",
                  actionText: worksheet.minus_3,
                ),
                TableCard(
                  moodValue: "-4",
                  actionText: worksheet.minus_4,
                ),
                TableCard(
                  moodValue: "-5",
                  actionText: worksheet.minus_5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TableCard extends StatelessWidget {
  const TableCard({
    super.key,
    required this.moodValue,
    required this.actionText,
  });

  final String moodValue;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(10),
      color: colors.onPrimary,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 50,
            decoration: BoxDecoration(
              color: colors.secondaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Center(
                child: Text(
              moodValue,
              style: TextStyle(color: colors.outline, fontSize: 22),
            )),
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
                      color: colors.inverseSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
