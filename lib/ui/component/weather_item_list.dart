import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/provider/usecase_provider.dart';
import 'buttons.dart';
import '../style/app_text_styles.dart';
import '../../domain/enum/weather.dart';

// 今日の天気の状態をリスト表示するクラス
class WeatherItemList extends ConsumerWidget {
  const WeatherItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherItems = ref.watch(weatherItemNotifierProvider);
    final notifier = ref.read(weatherItemNotifierProvider.notifier);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Weather.values.map((weather) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppButtons.customOutline(
              onPressed: () {
                notifier.toggleSelection(weather.index);
              },
              isSelected: weatherItems[weather.index].selected,
              fixedSize: const Size(100, 40),
              child: Text(
                weather.label,
                style: AppTextStyles.body.copyWith(fontSize: 14),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
