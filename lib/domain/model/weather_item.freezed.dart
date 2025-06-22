// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherItem {
  Weather get weather;
  bool get selected;

  /// Create a copy of WeatherItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherItemCopyWith<WeatherItem> get copyWith =>
      _$WeatherItemCopyWithImpl<WeatherItem>(this as WeatherItem, _$identity);

  /// Serializes this WeatherItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherItem &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weather, selected);

  @override
  String toString() {
    return 'WeatherItem(weather: $weather, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $WeatherItemCopyWith<$Res> {
  factory $WeatherItemCopyWith(
          WeatherItem value, $Res Function(WeatherItem) _then) =
      _$WeatherItemCopyWithImpl;
  @useResult
  $Res call({Weather weather, bool selected});
}

/// @nodoc
class _$WeatherItemCopyWithImpl<$Res> implements $WeatherItemCopyWith<$Res> {
  _$WeatherItemCopyWithImpl(this._self, this._then);

  final WeatherItem _self;
  final $Res Function(WeatherItem) _then;

  /// Create a copy of WeatherItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? selected = null,
  }) {
    return _then(_self.copyWith(
      weather: null == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherItem implements WeatherItem {
  const _WeatherItem({required this.weather, required this.selected});
  factory _WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemFromJson(json);

  @override
  final Weather weather;
  @override
  final bool selected;

  /// Create a copy of WeatherItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherItemCopyWith<_WeatherItem> get copyWith =>
      __$WeatherItemCopyWithImpl<_WeatherItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherItem &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weather, selected);

  @override
  String toString() {
    return 'WeatherItem(weather: $weather, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$WeatherItemCopyWith<$Res>
    implements $WeatherItemCopyWith<$Res> {
  factory _$WeatherItemCopyWith(
          _WeatherItem value, $Res Function(_WeatherItem) _then) =
      __$WeatherItemCopyWithImpl;
  @override
  @useResult
  $Res call({Weather weather, bool selected});
}

/// @nodoc
class __$WeatherItemCopyWithImpl<$Res> implements _$WeatherItemCopyWith<$Res> {
  __$WeatherItemCopyWithImpl(this._self, this._then);

  final _WeatherItem _self;
  final $Res Function(_WeatherItem) _then;

  /// Create a copy of WeatherItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? weather = null,
    Object? selected = null,
  }) {
    return _then(_WeatherItem(
      weather: null == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
