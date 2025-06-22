import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/weather.dart';

part 'weather_item.freezed.dart';
part 'weather_item.g.dart';

/// [WeatherItem] は、天気のモデルクラス
@freezed
abstract class WeatherItem with _$WeatherItem {
  /// [type]: 天気の種類
  /// [selected]: 選択状態（デフォルトはfalse）
  const factory WeatherItem({
    required Weather weather,
    required bool selected,
  }) = _WeatherItem;

  factory WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemFromJson(json);
}
