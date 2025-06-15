// ignore_for_file: use_build_context_synchronously

import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/graph/add_mood_point_usecase.dart';
import '../../application/graph/states/saving_status_notifier.dart';
import '../../../generated/l10n.dart';
import '../common/components/notification_settings_dialog.dart';
import '../../domain/app_exception.dart';
import '../../utils/app_colors.dart';
import '../../utils/page_navigator.dart';
import '../common/components/snackbars.dart';
import '../common/error_handler_mixin.dart';
import '../diagnosis/table_page.dart';
import '../../domain/weather.dart';
import '../common/components/weather_item_list.dart';
import '../common/components/date_picker_title.dart';
import '../../domain/models/record_item_type.dart';
import '../../utils/load_interstitial_ad.dart';
import '../../utils/record_item_utils.dart';

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
  bool _isModalPop = true;
  final InAppReview _inAppReview = InAppReview.instance;

  int moodNum = 1;
  void _changeSlider(double e) => setState(() {
        _plannedValue = e;
      });
  double _moodValue = 1.0;

  double _sleepHours = 8.0;

  int _stepCount = 1000;

  final List<Weather> _weather = [];

  String _memo = '';

  /// スライダーの値を変更する際に、RecordItemTypeに応じて処理を分岐
  void _changeSliderForRecordItemPoint(double e, RecordItemType type) {
    setState(() {
      switch (type) {
        case RecordItemType.sleep:
          _sleepHours = clampSleepHours(e);
          break;
        case RecordItemType.steps:
          _stepCount = clampStepCount(e);
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    _isModalPop = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: DatePickerTtileButton(
          date: date,
          onDateChanged: (selectedDate) {
            setState(() {
              date = selectedDate;
            });
          },
        ),
      ),
      bottomSheet: SizedBox(
        height: 115,
        child: BottomAppBar(
          shadowColor: AppColors.black,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ref.watch(isSavingProvider) == SavingType.none
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        foregroundColor: AppColors.white,
                      ),
                      onPressed: () async {
                        final scaffoldMessenger =
                            ref.read(scaffoldMessengerKeyProvider).currentState;
                        if (scaffoldMessenger == null) return;
                        try {
                          // mood_points コレクションにドキュメントを追加
                          final result = await ref
                              .read(addMoodPointUsecaseProvider(widget.uid))
                              .execute(
                                point: _moodValue.toInt(),
                                plannedVolume: _plannedValue.toInt(),
                                sleepHours: _sleepHours.toDouble(),
                                stepCount: _stepCount.toInt(),
                                weather: _weather.toList(),
                                memo: _memo.toString(),
                                moodDate: date,
                              );

                          // 同じ日付に既に登録されている場合は上書きされる旨の確認ダイアログを表示
                          if (!result) {
                            ref.read(isSavingProvider.notifier).setSaving();
                            return _showConfirmDialog(
                              date: date,
                              uid: widget.uid,
                              parent: context,
                            );
                          }
                          // 初回記録時のみ通知設定ダイアログを表示
                          final prefs = await SharedPreferences.getInstance();
                          final hasShownNotificationDialog =
                              prefs.getBool('has_shown_notification_dialog') ??
                                  false;
                          final recordCount = prefs.getInt('record_count') ?? 0;
                          final newRecordCount = recordCount + 1;
                          await prefs.setInt('record_count', newRecordCount);

                          // 3回目 or 10の倍数回目 の記録時にレビュー促進
                          if (newRecordCount == 3 || newRecordCount % 10 == 0) {
                            if (await _inAppReview.isAvailable()) {
                              await _inAppReview.requestReview();
                            }
                          } else if (hasShownNotificationDialog) {
                            loadInterstitialAd();
                          }

                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );
                          if (!_isModalPop) return;

                          if (!hasShownNotificationDialog && context.mounted) {
                            await showDialog(
                              context: context,
                              builder: (context) =>
                                  const NotificationSettingsDialog(),
                            );
                            await prefs.setBool(
                                'has_shown_notification_dialog', true);
                          }

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
                          fontSize: 18,
                        ),
                      ),
                    )
                  : ref.watch(isSavingProvider) == SavingType.saving
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: AppColors.white,
                          ),
                          onPressed: () {},
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 2.5,
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: AppColors.white,
                          ),
                          child: Checkmark(
                            weight: 2.5,
                            size: 20,
                            color: AppColors.white,
                          ),
                        ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: bottomSpace == 0 ? false : true,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          S.of(context).moodValueQuestion,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Tooltip(
                        showDuration: const Duration(seconds: 3),
                        triggerMode: TooltipTriggerMode.tap,
                        message: S.of(context).moodValueQuestionTooltipMessage,
                        child: Icon(
                          Icons.help,
                          color: AppColors.grey,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Slider(
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
                    label: null,
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
                  SizedBox(
                    width: 75,
                    child: Center(
                      child: Text(
                        _moodValue.toInt().toString(),
                        style: const TextStyle(fontSize: 52),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          PageNavigator.pushWithSlideFromBottom(
                            context,
                            TablePage(uid: widget.uid),
                          );
                        },
                        label: Center(
                          child: Text(
                            S.of(context).goTable,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        iconAlignment: IconAlignment.end,
                        icon: Icon(
                          Icons.arrow_right,
                          color: AppColors.black,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          S.of(context).plannedVolumeQuestion,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Tooltip(
                        showDuration: const Duration(seconds: 3),
                        triggerMode: TooltipTriggerMode.tap,
                        message:
                            S.of(context).plannedVolumeQuestionTooltipMessage,
                        child: Icon(
                          Icons.help,
                          color: AppColors.grey,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Slider(
                    label: null,
                    min: 0,
                    max: 16,
                    value: _plannedValue,
                    divisions: 16,
                    onChanged: _changeSlider,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
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
                    ],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "この日の睡眠時間は何時間？", // TODO: ローカライズ
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Slider(
                    label: null,
                    min: 0,
                    max: 16,
                    value: _sleepHours,
                    divisions: 32, // 0.5刻み
                    onChanged: (value) => _changeSliderForRecordItemPoint(
                        value, RecordItemType.sleep),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                              child: Center(
                                child: Text(
                                  _sleepHours.toString(),
                                  style: const TextStyle(fontSize: 52),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "この日の歩数は？", // TODO: ローカライズ
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Slider(
                    label: null,
                    min: 0,
                    max: 20000,
                    value: _stepCount.toDouble(), // 歩数は整数なのでdoubleに変換
                    divisions: 16,
                    onChanged: (value) => _changeSliderForRecordItemPoint(
                        value, RecordItemType.steps),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 175,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                              child: Center(
                                child: Text(
                                  _stepCount.toInt().toString(),
                                  style: const TextStyle(fontSize: 52),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "この日の天気は？", // TODO: ローカライズ
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  const WeatherItemList(), // TODO: List<Weather> _weatherに渡せるように変更する必要あり
                  SizedBox(
                    height: 40,
                  ), // 一言メモの入力欄
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "一言メモ", // TODO: ローカライズ
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    maxLines: 5,
                    maxLength: 300, // 最大文字数300
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.grey),
                      ),
                      counterText: '', // 文字数カウンター非表示
                    ),
                    onChanged: (value) {
                      if (value.length <= 300) {
                        setState(() {
                          _memo = value;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 115 + bottomSpace), // 画面下部のスペースを確保
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 同じ日付に既に登録されている場合の確認ダイアログの表示処理
  Future<void> _showConfirmDialog({
    required String uid,
    required DateTime date,
    required BuildContext parent,
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
                        sleepHours: _sleepHours.toDouble(),
                        stepCount: _stepCount.toInt(),
                        weather: _weather.toList(),
                        memo: _memo.toString(),
                        moodDate: date,
                      );

                  // 初回記録時のみ通知設定ダイアログを表示
                  final prefs = await SharedPreferences.getInstance();
                  final hasShownNotificationDialog =
                      prefs.getBool('has_shown_notification_dialog') ?? false;
                  final recordCount = prefs.getInt('record_count') ?? 0;
                  final newRecordCount = recordCount + 1;
                  await prefs.setInt('record_count', newRecordCount);

                  // 3回目 or 10の倍数回目 の記録時にレビュー促進
                  if (newRecordCount == 3 || newRecordCount % 10 == 0) {
                    if (await _inAppReview.isAvailable()) {
                      await _inAppReview.requestReview();
                    }
                  } else if (hasShownNotificationDialog) {
                    loadInterstitialAd();
                  }

                  await Future.delayed(
                    const Duration(milliseconds: 500),
                  );
                  if (!_isModalPop) return;

                  if (!hasShownNotificationDialog && parent.mounted) {
                    await showDialog(
                      context: parent,
                      builder: (context) => const NotificationSettingsDialog(),
                    );
                    await prefs.setBool('has_shown_notification_dialog', true);
                  }

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
    ref.read(isSavingProvider.notifier).setSaved();
  }
}
