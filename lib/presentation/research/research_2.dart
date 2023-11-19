import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Research2 extends ConsumerStatefulWidget {
  const Research2({super.key});

  @override
  Research2State createState() => Research2State();
}

class Research2State extends ConsumerState<Research2> {
  DateTime visibleMinimum = DateTime(2023, 11, 1);
  DateTime visibleMaximum = DateTime(2023, 11, 30);
  final moodDataList = <MoodData>[];

  @override
  void initState() {
    super.initState();

    moodDataList.addAll(List<MoodData>.generate(
      DateTime(2023, 12, 31).difference(DateTime(2023, 10, 1)).inDays + 1,
      (index) {
        DateTime date = DateTime(2023, 10, 1).add(Duration(days: index));

        int points;
        do {
          points = Random().nextInt(11) - 5;
        } while (points == 0);

        return MoodData(date, points.toDouble());
      },
    ));
  }

  void updateVisibleRange(DateTime start, DateTime end) {
    setState(() {
      visibleMinimum = start;
      visibleMaximum = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Trend'),
        actions: <Widget>[
          DropdownButton<int>(
            value: visibleMinimum.month,
            items: List.generate(12, (index) {
              int month = index + 1;
              return DropdownMenuItem(
                value: month,
                child: Text('2023年 $month月'),
              );
            }),
            onChanged: (int? month) {
              if (month != null) {
                DateTime start = DateTime(2023, month);
                DateTime end =
                    DateTime(2023, month + 1).subtract(const Duration(days: 0));
                updateVisibleRange(start, end);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.95,
          heightFactor: 0.5,
          child: SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              visibleMinimum: visibleMinimum,
              visibleMaximum: visibleMaximum,
            ),
            primaryYAxis: NumericAxis(minimum: -6, maximum: 6),
            title: ChartTitle(text: 'Monthly Mood Trend'),
            legend: const Legend(isVisible: false),
            tooltipBehavior: tooltipBehavior,
            // series: <LineSeries<MoodData, DateTime>>[
            //   LineSeries<MoodData, DateTime>(
            //     dataSource: moodDataList,
            //     xValueMapper: (MoodData sales, _) => sales.date,
            //     yValueMapper: (MoodData sales, _) => sales.points,
            //     dataLabelSettings: const DataLabelSettings(isVisible: false),
            //   )
            // ],
            series: <ChartSeries>[
              // 塗りつぶす部分を描画するためのエリアチャート
              SplineAreaSeries<MoodData, DateTime>(
                dataSource: moodDataList,
                xValueMapper: (MoodData value, _) => value.date,
                yValueMapper: (MoodData value, _) => value.points,
                //color: colors.secondaryContainer,
                borderDrawMode: BorderDrawMode.excludeBottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('M/d').format(dateTime);
}

class MoodData {
  MoodData(this.date, this.points);
  final DateTime date;
  final double points;
}
