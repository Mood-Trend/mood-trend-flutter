import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mood_trend_flutter/domain/mood_point.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/common/setting_page.dart';
import 'package:mood_trend_flutter/presentation/common/components/custom_tooltip_behavior.dart';
import 'package:mood_trend_flutter/utils/datetime_extension.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../application/graph/states/subscribe_mood_points_provider.dart';
import '../../utils/app_colors.dart';
import 'input_modal.dart';

// グラフ表示期間を示す列挙体
enum Term {
  /// 1 ヶ月
  month,

  /// 半年
  halfYear,

  /// 1 年
  year,
}

/// 表示期間選択状態を示す [StateProvider]
final selectedTermProvider = StateProvider<Term>((_) => Term.month);

/// グラフの最小値を保持する [StateProvider]
final visibleMinimumProvider = StateProvider<DateTime>(
  (ref) => ref.watch(selectedTermProvider) == Term.month
      ? DateTime.now().subtract(
          const Duration(days: 30),
        )
      : ref.watch(selectedTermProvider) == Term.halfYear
          ? DateTime.now().subtract(
              const Duration(days: 182),
            )
          : DateTime.now().subtract(
              const Duration(days: 365),
            ),
);

/// グラフの最大値を保持する [StateProvider]
final visibleMaximumProvider = StateProvider<DateTime>(
  (ref) => DateTime.now().toDateOnly(),
);

/// グラフを表示するメインの画面
class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTerm = ref.watch(selectedTermProvider);

    final visibleMinDate = ref.watch(visibleMinimumProvider);

    // コーチマーク用のターゲット
    final GlobalKey floatingActionButtonKey = GlobalKey();

    // コーチマークのセットアップ
    Future<void> showCoachMark() async {
      final prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
      if (isFirstLaunch) {
        final coachMark = TutorialCoachMark(
          targets: [
            TargetFocus(
              keyTarget: floatingActionButtonKey,
              contents: [
                TargetContent(
                  align: ContentAlign.top,
                  child: Column(
                    children: [
                      Text(
                        S.of(context).homeCoachMarkTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).homeCoachMarkBody,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          colorShadow: Colors.black,
          textSkip: S.of(context).onboardingSkip,
          onFinish: () async {
            await prefs.setBool('isFirstLaunch', false);
          },
        );
        coachMark.show(context: context);
        await prefs.setBool('isFirstLaunch', false);
      }
    }

    // 初回起動時にコーチマークを表示
    Future.delayed(Duration.zero, () {
      showCoachMark();
    });

    ButtonStyle buttonStyle(Term term) {
      return TextButton.styleFrom(
        /// 文字色は選択されている場合は白、そうでない場合は黒
        foregroundColor:
            selectedTerm == term ? AppColors.white : AppColors.black,

        /// 背景色は選択されている場合は緑、そうでない場合は透明
        backgroundColor:
            selectedTerm == term ? AppColors.green : Colors.transparent,
      );
    }

    // ツールチップの設定
    final TooltipBehavior tooltipBehavior =
        createCustomTooltipBehavior(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => ref
                  .read(selectedTermProvider.notifier)
                  .update((state) => Term.year),
              style: buttonStyle(Term.year),
              child: Text(S.of(context).homeYear),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => ref
                  .read(selectedTermProvider.notifier)
                  .update((state) => Term.halfYear),
              style: buttonStyle(Term.halfYear),
              child: Text(S.of(context).homeHalfYear),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => ref
                  .read(selectedTermProvider.notifier)
                  .update((state) => Term.month),
              style: buttonStyle(Term.month),
              child: Text(S.of(context).homeMonth),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => PageNavigator.push(
              context,
              SettingPage(uid: userId),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: AsyncValueHandler(
            value: ref.watch(subscribeMoodPointsProvider(userId)),
            loading: () => const OverlayLoading(),
            builder: (moodPoints) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: SfCartesianChart(
                    key: ValueKey(visibleMinDate),
                    tooltipBehavior: tooltipBehavior,
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true, // スクロール（パンニング）を有効化
                      zoomMode: ZoomMode.x, // X軸方向のズーム/パンのみ有効化
                    ),
                    legend: const Legend(isVisible: true), // 凡例の表示
                    backgroundColor: AppColors.white,
                    primaryXAxis: DateTimeAxis(
                      dateFormat: DateFormat('MM/dd',
                          Localizations.localeOf(context).languageCode),
                      minimum: moodPoints.isNotEmpty &&
                              moodPoints.first.moodDate
                                  .toDateOnly()
                                  .isBefore(visibleMinDate)
                          ? moodPoints.first.moodDate.toDateOnly()
                          : visibleMinDate,
                      maximum: DateTime.now(),
                      initialVisibleMinimum: visibleMinDate, // 表示範囲の最小値
                      initialVisibleMaximum: DateTime.now(),
                      interval: switch (ref.watch(selectedTermProvider)) {
                        Term.month => 7,
                        Term.halfYear => 1,
                        Term.year => 1,
                      },
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: -5,
                      maximum: 5,
                      interval: 1,
                      numberFormat: NumberFormat('0'),
                      plotBands: [
                        PlotBand(
                          isVisible: true,
                          start: double.infinity,
                          end: 0,
                          color: Colors.white,
                        ),
                        PlotBand(
                          isVisible: true,
                          start: -double.infinity,
                          end: 0,
                          color: const Color.fromRGBO(249, 249, 249, 1),
                        ),
                      ],
                    ),
                    axes: [
                      NumericAxis(
                        minimum: 0,
                        maximum: 16,
                        interval: 1,
                        name: 'yAxis',
                        opposedPosition: true,
                      ),
                    ],
                    series: [
                      // 塗りつぶす部分を描画するためのエリアチャート
                      SplineAreaSeries<MoodPoint, DateTime>(
                        name: S.of(context).moodValue, // 凡例の名前
                        dataSource: moodPoints,
                        xValueMapper: (MoodPoint value, _) =>
                            value.moodDate.toDateOnly(),
                        yValueMapper: (MoodPoint value, _) => value.point,
                        color: AppColors.green.withValues(alpha: 0.5),
                        markerSettings: const MarkerSettings(isVisible: true),
                        splineType: SplineType.monotonic,
                      ),
                      SplineAreaSeries<MoodPoint, DateTime>(
                        name: S.of(context).plannedVolume, // 凡例の名前
                        dataSource: moodPoints,
                        xValueMapper: (MoodPoint value, _) =>
                            value.moodDate.toDateOnly(),
                        yValueMapper: (MoodPoint value, _) =>
                            value.plannedVolume,
                        color: AppColors.blue.withValues(alpha: 0.5),
                        markerSettings: const MarkerSettings(isVisible: true),
                        yAxisName: 'yAxis',
                        splineType: SplineType.monotonic,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        key: floatingActionButtonKey,
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          PageNavigator.pushWithSlideFromBottom(
            context,
            InputModal(uid: userId),
          );
        },
        child: Icon(Icons.add, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.lightGreen,
        notchMargin: 20,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
