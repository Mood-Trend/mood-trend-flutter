import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/table_page.dart';

import '../infrastructure/firebase/mood_worksheet_repository.dart';
import 'components/async_value_handler.dart';
import 'components/loading.dart';
import 'mixin/error_handler_mixin.dart';

class EditDialog extends ConsumerStatefulWidget {
  const EditDialog({super.key});
  @override
  ConsumerState<EditDialog> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<EditDialog> with ErrorHandlerMixin {
  double _moodValue = 1;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    final colors = Theme.of(context).colorScheme;
    return AsyncValueHandler(
      value: ref.watch(worksheetProvider),
      loading: () => const OverlayLoading(),
      builder: (worksheet) {
        controller.text = worksheet.plus_1;
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
                            controller.text = confirmMoodWorksheet(
                              _moodValue.toInt(),
                              worksheet,
                            );
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
                    controller: controller,
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
                    final newMoodWorksheet = updateMoodWorksheet(
                      _moodValue.toInt(),
                      worksheet,
                      controller.text,
                    );
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
      },
    );
  }
}
