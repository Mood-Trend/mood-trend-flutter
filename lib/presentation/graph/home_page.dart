import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mood_trend_flutter/domain/mood_point.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/common/setting_page.dart';
import 'package:mood_trend_flutter/utils/datetime_extension.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      ? ref.watch(visibleMaximumProvider).subtract(
            const Duration(days: 30),
          )
      : ref.watch(selectedTermProvider) == Term.halfYear
          ? ref.watch(visibleMaximumProvider).subtract(
                const Duration(days: 182),
              )
          : ref.watch(visibleMaximumProvider).subtract(
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
            onPressed: () => ref
                .watch(visibleMaximumProvider.notifier)
                .update((_) => DateTime.now().toDateOnly()),
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => PageNavigator.push(
              context,
              SettingPage(uid: userId),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: AsyncValueHandler(
          value: ref.watch(subscribeMoodPointsProvider(userId)),
          loading: () => const OverlayLoading(),
          builder: (moodPoints) {
            final term = ref.watch(selectedTermProvider) == Term.month
                ? const Duration(days: 30)
                : ref.watch(selectedTermProvider) == Term.halfYear
                    ? const Duration(days: 182)
                    : const Duration(days: 365);
            return Center(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    ref
                        .watch(visibleMaximumProvider.notifier)
                        .update((state) => state.subtract(term));
                  } else {
                    ref
                        .watch(visibleMaximumProvider.notifier)
                        .update((state) => state.add(term));
                  }
                },
                child: SfCartesianChart(
                  legend: const Legend(isVisible: true), // 凡例の表示
                  backgroundColor: AppColors.white,
                  primaryXAxis: DateTimeAxis(
                    dateFormat: DateFormat(
                        'MM/dd', Localizations.localeOf(context).languageCode),
                    minimum: ref.watch(visibleMinimumProvider),
                    maximum: ref.watch(visibleMaximumProvider),
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
                    LineSeries<MoodPoint, DateTime>(
                      name: S.of(context).moodValue, // 凡例の名前
                      dataSource: moodPoints,
                      xValueMapper: (MoodPoint value, _) =>
                          value.moodDate.toDateOnly(),
                      yValueMapper: (MoodPoint value, _) => value.point,
                      color: AppColors.green.withOpacity(0.5),
                      markerSettings: const MarkerSettings(isVisible: true),
                      // borderDrawMode: RangeAreaBorderMode.excludeSides,
                    ),
                    LineSeries<MoodPoint, DateTime>(
                      name: S.of(context).plannedVolume, // 凡例の名前
                      dataSource: moodPoints,
                      xValueMapper: (MoodPoint value, _) =>
                          value.moodDate.toDateOnly(),
                      yValueMapper: (MoodPoint value, _) => value.plannedVolume,
                      color: AppColors.blue.withOpacity(0.5),
                      markerSettings: const MarkerSettings(isVisible: true),
                      yAxisName: 'yAxis',
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.grey,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.white,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return InputModal(uid: userId);
            },
          );
        },
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
