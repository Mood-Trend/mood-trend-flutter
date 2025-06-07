import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'buttons.dart';
import '../theme/app_text_styles.dart';
import '../../../domain/weather.dart';

// 今日の天気の状態をリスト表示するクラス
class WeatherItemList extends ConsumerWidget {
  const WeatherItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Weather.values.map((weather) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppButtons.outlined(
              onPressed: () {/* TODO: implement selection logic */},
              isSelected: false, // TODO: implement selection state
              fixedSize: const Size(120, 80),
              child: Text(
                weather.label,
                style: AppTextStyles.body.copyWith(fontSize: 18),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
