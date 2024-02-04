// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mood_trend_flutter/application/graph/add_mood_point_usecase.dart';

import '../../utils/app_colors.dart';
import '../../utils/page_navigator.dart';
import '../common/error_handler_mixin.dart';
import '../diagnosis/table_page.dart';

/// グラフ情報入力の画面
class InputModal extends ConsumerStatefulWidget {
  const InputModal({super.key});

  @override
  ConsumerState<InputModal> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<InputModal> with ErrorHandlerMixin {
  double _plannedValue = 0.0;
  DateTime date = DateTime.now();

  int moodNum = 1;
  void _changeSlider(double e) => setState(() {
        _plannedValue = e;
      });
  double _moodValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white,
      ),
      height: 410,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),
          TextButton.icon(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary:
                            AppColors.green, // 背景色のテーマや選択時の背景色、キャンセルOKボタンの色
                        onPrimary: AppColors.white, // 選択時のテキストカラー
                        surface: AppColors.white, // カレンダーの背景色
                        onSurface: AppColors.black, // カレンダーのテキストカラー
                        surfaceTint: Colors.transparent, // カレンダーの背景にうっすらかかる色
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (selectedDate != null) {
                setState(() {
                  date = selectedDate;
                });
              }
            },
            icon: Icon(
              Icons.calendar_month,
              color: AppColors.green,
            ),
            label: Text(
              "${date.year.toString()}年${date.month.toString().padLeft(2)}月${date.day.toString().padLeft(2)}日",
              style: TextStyle(
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 48, 56, 0),
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
                  const Text(
                    '気分値',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Center(
                        child: Text(
                          _moodValue.toInt().toString(),
                          style: const TextStyle(fontSize: 52),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 24, 56, 0),
            child: Slider(
              label: _plannedValue.toInt().toString(),
              min: 0,
              max: 16,
              value: _plannedValue,
              divisions: 16,
              onChanged: _changeSlider,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 56, 18, 0),
                child: IconButton(
                  onPressed: () => PageNavigator.push(
                    context,
                    const TablePage(),
                  ),
                  icon: Icon(
                    Icons.align_horizontal_left,
                    color: AppColors.green,
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    '予定数',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Center(
                        child: Text(
                          _plannedValue.toInt().toString(),
                          style: const TextStyle(fontSize: 52),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 56, 16, 0),
                child: TextButton(
                  onPressed: () async {
                    run(
                      ref,
                      action: () async {
                        // mood_points コレクションにドキュメントを追加
                        final result =
                            await ref.read(addMoodPointUsecaseProvider).execute(
                                  point: _moodValue.toInt(),
                                  plannedVolume: _plannedValue.toInt(),
                                  moodDate: date,
                                );
                        // 同じ日付に既に登録されている場合は上書きされる旨の確認ダイアログを表示
                        if (!result) return _showConfirmDialog(date: date);
                        Navigator.pop(context);
                      },
                      successMessage: '気分値と予定数の登録が完了しました',
                    );
                  },
                  child: Text(
                    '保存',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  /// 同じ日付に既に登録されている場合の確認ダイアログの表示処理
  Future<void> _showConfirmDialog({
    required DateTime date,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        final formattedDate = DateFormat('yyyy年M月d日').format(date);
        return AlertDialog(
          // 対象日付には既に登録されている旨のメッセージを表示
          title: Text('$formattedDateには既に登録されています'),
          content: const Text('上書きしてもよろしいですか？'),
          actions: [
            TextButton(
              onPressed: () {
                PageNavigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(addMoodPointUsecaseProvider).executeForContinue(
                      point: _moodValue.toInt(),
                      plannedVolume: _plannedValue.toInt(),
                      moodDate: date,
                    );
                Navigator.pop(context);
              },
              child: const Text('上書き'),
            ),
          ],
        );
      },
    );
  }
}
