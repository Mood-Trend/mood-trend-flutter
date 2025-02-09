// ignore_for_file: use_build_context_synchronously

import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:mood_trend_flutter/application/graph/add_mood_point_usecase.dart';
import 'package:mood_trend_flutter/application/graph/states/is_saving_provider.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/utils/get_ad_mob_unit_id.dart';

import '../../domain/app_exception.dart';
import '../../utils/app_colors.dart';
import '../../utils/page_navigator.dart';
import '../common/components/snackbars.dart';
import '../common/error_handler_mixin.dart';
import '../diagnosis/table_page.dart';

final selectedTermProvider = StateProvider<RewardedAd?>((_) => null);

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
  // bool _isContinueSaving = false;

  int moodNum = 1;
  void _changeSlider(double e) => setState(() {
        _plannedValue = e;
      });
  double _moodValue = 1.0;

  @override
  void dispose() {
    _isModalPop = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // インタースティシャル広告をロード
    void loadInterstitialAd() {
      InterstitialAd.load(
        adUnitId: getAdMobUnitId(),
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            ad.show();
          },
          onAdFailedToLoad: (error) {},
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: TextButton.icon(
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
                      primary: AppColors.green, // 背景色のテーマや選択時の背景色、キャンセルOKボタンの色
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
              setState(
                () {
                  date = selectedDate;
                },
              );
            }
          },
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 24,
            color: AppColors.black,
          ),
          label: Text(
            DateFormat('yyyy/MM/dd').format(date),
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
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

                          loadInterstitialAd();

                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );
                          if (!_isModalPop) return;
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
    // required bool isContinueSaving,
  }) async {
    void loadInterstitialAd() {
      InterstitialAd.load(
        adUnitId: getAdMobUnitId(),
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            ad.show();
          },
          onAdFailedToLoad: (error) {},
        ),
      );
    }

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

                  loadInterstitialAd();

                  await Future.delayed(const Duration(milliseconds: 500));
                  if (!_isModalPop) return;
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
