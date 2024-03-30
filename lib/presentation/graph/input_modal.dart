// ignore_for_file: use_build_context_synchronously

import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mood_trend_flutter/application/graph/add_mood_point_usecase.dart';
import 'package:mood_trend_flutter/application/graph/states/is_saving_provider.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';

import '../../domain/app_exception.dart';
import '../../utils/app_colors.dart';
import '../../utils/page_navigator.dart';
import '../common/components/snackbars.dart';
import '../common/error_handler_mixin.dart';
import '../diagnosis/table_page.dart';

/// グラフ情報入力の画面
class InputModal extends ConsumerStatefulWidget {
  const InputModal({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<InputModal> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<InputModal> with ErrorHandlerMixin {
  double _plannedValue = 0.0;
  DateTime date = DateTime.now();
  // bool _isContinueSaving = false;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                              primary: AppColors
                                  .green, // 背景色のテーマや選択時の背景色、キャンセルOKボタンの色
                              onPrimary: AppColors.white, // 選択時のテキストカラー
                              surface: AppColors.white, // カレンダーの背景色
                              onSurface: AppColors.black, // カレンダーのテキストカラー
                              surfaceTint:
                                  Colors.transparent, // カレンダーの背景にうっすらかかる色
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (selectedDate != null) {
                      setState(
                        () {
                          date = selectedDate;
                        },
                      );
                    }
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: AppColors.green,
                  ),
                  label: Text(
                    DateFormat('yyyy/MM/dd').format(date),
                    style: TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     const Text('続けて保存'),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 8.0),
                //       child: Switch(
                //         activeColor: AppColors.green,
                //         inactiveTrackColor: AppColors.grey,
                //         value: _isContinueSaving,
                //         onChanged: (value) {
                //           setState(() => _isContinueSaving = value);
                //         },
                //       ),
                //     ),
                //   ],
                // )
              ],
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
                    setState(
                      () {
                        _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                      },
                    );
                  }
                },
                label: _moodValue.toInt().toString(),
                onChanged: (value) {
                  if (value != 0.0) {
                    setState(
                      () {
                        _moodValue = value;
                      },
                    );
                  }
                },
                onChangeEnd: (value) {
                  if (value == 0.0) {
                    setState(
                      () {
                        _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                      },
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).moodValue,
                      style: const TextStyle(fontSize: 24),
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
                  padding: const EdgeInsets.fromLTRB(15, 56, 15, 0),
                  child: IconButton(
                    onPressed: () {
                      PageNavigator.push(
                        context,
                        TablePage(uid: widget.uid),
                      );
                    },
                    icon: Icon(
                      Icons.table_chart_outlined,
                      color: AppColors.green,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).plannedVolume,
                      style: const TextStyle(fontSize: 24),
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
                  padding: const EdgeInsets.fromLTRB(0, 56, 15, 0),
                  child: ref.watch(isSavingProvider) == SavingType.none
                      ? TextButton(
                          onPressed: () async {
                            final scaffoldMessenger = ref
                                .read(scaffoldMessengerKeyProvider)
                                .currentState;
                            if (scaffoldMessenger == null) return;
                            try {
                              // mood_points コレクションにドキュメントを追加
                              final result = await ref
                                  .read(addMoodPointUsecaseProvider(widget.uid))
                                  .execute(
                                    point: _moodValue.toInt(),
                                    plannedVolume: _plannedValue.toInt(),
                                    moodDate: date,
                                  );

                              // 同じ日付に既に登録されている場合は上書きされる旨の確認ダイアログを表示
                              if (!result) {
                                ref
                                    .read(isSavingProvider.notifier)
                                    .update((_) => SavingType.saving);
                                return _showConfirmDialog(
                                  date: date,
                                  uid: widget.uid,
                                  parent: context,
                                  // isContinueSaving: _isContinueSaving,
                                );
                              }

                              // // 続けて保存が選択されている場合はモーダル継続
                              // if (_isContinueSaving) return;

                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                              Navigator.pop(context);
                            } on AppException catch (e) {
                              FailureSnackBar.show(
                                scaffoldMessenger,
                                message: e.toString(),
                              );
                            }
                          },
                          child: Text(
                            S.of(context).inputSave,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.green,
                            ),
                          ),
                        )
                      : ref.watch(isSavingProvider) == SavingType.saving
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: AppColors.green,
                                strokeWidth: 2.5,
                              ),
                            )
                          : AnimatedCheckmark(
                              weight: 2.5,
                              size: 20,
                              color: AppColors.green,
                            ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 同じ日付に既に登録されている場合の確認ダイアログの表示処理
  Future<void> _showConfirmDialog({
    required String uid,
    required DateTime date,
    required BuildContext parent,
    // required bool isContinueSaving,
  }) async {
    await showDialog(
      context: parent,
      builder: (context) {
        final formattedDate = DateFormat('yyyy/MM/dd').format(date);
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          // 対象日付には既に登録されている旨のメッセージを表示
          title: Text('$formattedDate ${S.of(context).inputAlreadyExist}'),
          content: Text(S.of(context).inputOverwritingQuestion),
          actions: [
            TextButton(
              onPressed: () {
                PageNavigator.pop(context);
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () async {
                final scaffoldMessenger =
                    ref.read(scaffoldMessengerKeyProvider).currentState;
                if (scaffoldMessenger == null) return;
                try {
                  await PageNavigator.pop(context);
                  await ref
                      .read(addMoodPointUsecaseProvider(uid))
                      .executeForUpdate(
                        point: _moodValue.toInt(),
                        plannedVolume: _plannedValue.toInt(),
                        moodDate: date,
                      );
                  // // 続けて保存が選択されている場合はモーダル継続
                  // if (isContinueSaving) return;
                  // // 続けて保存が選択されていない場合はモーダルを閉じる
                  await Future.delayed(const Duration(milliseconds: 500));
                  await PageNavigator.pop(parent);
                } on AppException catch (e) {
                  FailureSnackBar.show(
                    scaffoldMessenger,
                    message: e.toString(),
                  );
                }
              },
              child: Text(S.of(context).inputOverwriting),
            ),
          ],
        );
      },
    );
    ref.read(isSavingProvider.notifier).update((_) => SavingType.none);
  }
}
