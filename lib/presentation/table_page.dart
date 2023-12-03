import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/mood_worksheet.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/mood_worksheet_repository.dart';
import 'package:mood_trend_flutter/presentation/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/components/loading.dart';
import 'package:mood_trend_flutter/presentation/mixin/error_handler_mixin.dart';

final worksheetProvider = StreamProvider<MoodWorksheet>(
    (ref) => ref.watch(moodWorksheetRepositoryProvider).subscribe());

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
                  return EditDialog(
                      worksheet: worksheet,
                      controller:
                          TextEditingController(text: worksheet.plus_1));
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

class EditDialog extends ConsumerStatefulWidget {
  const EditDialog(
      {super.key, required this.worksheet, required this.controller});
  final MoodWorksheet worksheet;
  final TextEditingController controller;
  @override
  ConsumerState<EditDialog> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<EditDialog> with ErrorHandlerMixin {
  double _moodValue = 1;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlertDialog(
        title: const Text("編集"),
        content: SizedBox(
          height: 320,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(52, 48, 52, 0),
                child: Slider(
                  value: _moodValue,
                  min: -5.0,
                  max: 5.0,
                  divisions: 10,
                  onChangeStart: (value) {
                    if (value == 0.0) {
                      setState(() {
                        _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                      });
                    }
                  },
                  label: _moodValue.toInt().toString(),
                  onChanged: (value) {
                    if (value != 0.0) {
                      setState(() {
                        widget.controller.text = confirmMoodWorksheet(
                            _moodValue.toInt(), widget.worksheet);
                        _moodValue = value;
                      });
                    }
                  },
                  onChangeEnd: (value) {
                    if (value == 0.0) {
                      setState(() {
                        _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                      });
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 24),
                      const Text(
                        '気分値',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 75,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Center(
                            child: Text(
                              _moodValue.toInt().toString(),
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "症状",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextFormField(
                controller: widget.controller,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 丸い角の設定
                      borderSide: BorderSide.none, // 枠線をなくす
                    ),
                    fillColor: colors.onPrimary,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: colors.primary, width: 2))),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("キャンセル"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("変更"),
            onPressed: () async {
              execute(context, ref, action: () async {
                final newMoodWorksheet = updateMoodWorksheet(_moodValue.toInt(),
                    widget.worksheet, widget.controller.text);
                ref.read(moodWorksheetRepositoryProvider).update(
                      worksheetId: newMoodWorksheet.worksheetId,
                      minus_5: newMoodWorksheet.minus_5,
                      minus_4: newMoodWorksheet.minus_4,
                      minus_3: newMoodWorksheet.minus_3,
                      minus_2: newMoodWorksheet.minus_2,
                      minus_1: newMoodWorksheet.minus_1,
                      plus_1: newMoodWorksheet.plus_1,
                      plus_2: newMoodWorksheet.plus_2,
                      plus_3: newMoodWorksheet.plus_3,
                      plus_4: newMoodWorksheet.plus_4,
                      plus_5: newMoodWorksheet.plus_5,
                    );
                Navigator.pop(context);
              }, successMessage: '症状ワークシートを変更しました');
            },
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
