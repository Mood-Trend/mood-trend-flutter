import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mood_trend_flutter/domain/mood_point.dart';
import 'package:mood_trend_flutter/presentation/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/components/loading.dart';
import 'package:mood_trend_flutter/presentation/setting_page.dart';
import 'package:mood_trend_flutter/presentation/table_page.dart';
import 'package:mood_trend_flutter/utils/datetime_extension.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../infrastructure/firebase/mood_point_repository.dart';
import 'mixin/error_handler_mixin.dart';

// グラフ表示期間を示す
enum Term {
  /// 1 ヶ月
  month,

  /// 半年
  halfYear,

  /// 1 年
  year,
}

/// [MoodPoint] を購読する [StreamProvider]
final subscribeMoodPointsProvider = StreamProvider<List<MoodPoint>>(
  (ref) => ref.watch(moodPointRepositoryProvider).subscribeMoodPoints(),
);

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

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    final selectedTerm = ref.watch(selectedTermProvider);
    ButtonStyle buttonStyle(Term term) {
      return TextButton.styleFrom(
        /// 文字色は選択されている場合は白、そうでない場合は黒
        foregroundColor:
            selectedTerm == term ? colors.onSecondary : colors.onBackground,

        /// 背景色は選択されている場合は緑、そうでない場合は白
        backgroundColor:
            selectedTerm == term ? colors.primary : colors.background,

        /// 枠線は緑に固定
        side: BorderSide(
          color: colors.secondary,
          width: 1,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => ref
                  .read(selectedTermProvider.notifier)
                  .update((state) => Term.year),
              style: buttonStyle(Term.year),
              child: const Text('1年'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => ref
                  .read(selectedTermProvider.notifier)
                  .update((state) => Term.halfYear),
              style: buttonStyle(Term.halfYear),
              child: const Text('半年'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => ref
                  .read(selectedTermProvider.notifier)
                  .update((state) => Term.month),
              style: buttonStyle(Term.month),
              child: const Text('1ヶ月'),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => PageNavigator.push(context, const SettingPage()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: AsyncValueHandler(
          value: ref.watch(subscribeMoodPointsProvider),
          loading: () => const OverlayLoading(),
          builder: (moodPoints) {
            return Center(
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat('MM/dd', 'ja_JP'),
                  visibleMinimum: ref.watch(visibleMinimumProvider),
                  visibleMaximum: ref.watch(visibleMaximumProvider),
                ),
                primaryYAxis: NumericAxis(
                  minimum: -5,
                  maximum: 5,
                  interval: 1,
                  numberFormat: NumberFormat('0'),
                ),
                series: <ChartSeries>[
                  // 塗りつぶす部分を描画するためのエリアチャート
                  SplineAreaSeries<MoodPoint, DateTime>(
                    dataSource: moodPoints,
                    xValueMapper: (MoodPoint value, _) =>
                        value.moodDate.toDateOnly(),
                    yValueMapper: (MoodPoint value, _) => value.point,
                    color: colors.secondaryContainer,
                    borderDrawMode: BorderDrawMode.excludeBottom,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: colors.background,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const InputModal();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
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
              );
              if (selectedDate != null) {
                setState(() {
                  date = selectedDate;
                });
              }
            },
            icon: const Icon(Icons.calendar_month),
            label: Text(
                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}"),
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
                    const TablePage(isEditMode: false),
                  ),
                  icon: Icon(
                    Icons.align_horizontal_left,
                    color: colors.primary,
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
                    execute(
                      context,
                      ref,
                      action: () async {
                        // mood_points コレクションにドキュメントを追加
                        await ref.read(moodPointRepositoryProvider).add(
                              point: _moodValue.toInt(),
                              plannedVolume: _plannedValue.toInt(),
                              moodDate: date,
                            );

                        // モーダルを閉じる
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      successMessage: '気分値と予定数の登録が完了しました',
                    );
                  },
                  child: const Text(
                    '保存',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
