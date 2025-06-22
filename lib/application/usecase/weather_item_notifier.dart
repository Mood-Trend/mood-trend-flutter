import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/weather_item.dart';
import '../../domain/enum/weather.dart';

/// [WeatherItemNotifier] は、天気のリストを管理するクラス。
///
/// - [WeatherItem] のリストを保持し、ユーザーがどの天気を選択したかを管理します。
class WeatherItemNotifier extends Notifier<List<WeatherItem>> {
  @override
  List<WeatherItem> build() {
    return [
      // 晴れ
      WeatherItem(weather: Weather.sunny, selected: false), // TODO:selectedは仮置き
      // 曇り
      WeatherItem(
          weather: Weather.cloudy, selected: false), // TODO:selectedは仮置き
      // 雨
      WeatherItem(weather: Weather.rainy, selected: false), // TODO:selectedは仮置き
      // 低気圧
      WeatherItem(
          weather: Weather.lowPressure, selected: false), // TODO:selectedは仮置き
    ];
  }

  /// [index] で指定された天気の選択状態（selected）を切り替えます。
  /// 範囲外のindexが指定された場合は何もしません。
  void toggleSelection(int index) {
    if (index < 0 || index >= state.length) return;
    state = List.generate(
      state.length,
      (i) => i == index
          ? state[i].copyWith(selected: !state[i].selected)
          : state[i],
    );
  }
}
