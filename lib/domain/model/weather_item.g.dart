// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherItem _$WeatherItemFromJson(Map<String, dynamic> json) => _WeatherItem(
      weather: $enumDecode(_$WeatherEnumMap, json['weather']),
      selected: json['selected'] as bool,
    );

Map<String, dynamic> _$WeatherItemToJson(_WeatherItem instance) =>
    <String, dynamic>{
      'weather': _$WeatherEnumMap[instance.weather]!,
      'selected': instance.selected,
    };

const _$WeatherEnumMap = {
  Weather.sunny: 'sunny',
  Weather.rainy: 'rainy',
  Weather.cloudy: 'cloudy',
  Weather.lowPressure: 'lowPressure',
};
