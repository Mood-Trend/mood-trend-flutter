// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodPoint {
  /// 気分値 ID
  String get pointId;

  /// 気分値
  int get point;

  /// 予定量
  int get plannedVolume; // 睡眠時間
  double? get sleepHours; // 歩数
  int? get stepCount; // 天気
  List<Weather> get weather; // メモ
  String? get memo;

  /// 気分日
  DateTime get moodDate;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoodPointCopyWith<MoodPoint> get copyWith =>
      _$MoodPointCopyWithImpl<MoodPoint>(this as MoodPoint, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoodPoint &&
            (identical(other.pointId, pointId) || other.pointId == pointId) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.plannedVolume, plannedVolume) ||
                other.plannedVolume == plannedVolume) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours) &&
            (identical(other.stepCount, stepCount) ||
                other.stepCount == stepCount) &&
            const DeepCollectionEquality().equals(other.weather, weather) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.moodDate, moodDate) ||
                other.moodDate == moodDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pointId,
      point,
      plannedVolume,
      sleepHours,
      stepCount,
      const DeepCollectionEquality().hash(weather),
      memo,
      moodDate);

  @override
  String toString() {
    return 'MoodPoint(pointId: $pointId, point: $point, plannedVolume: $plannedVolume, sleepHours: $sleepHours, stepCount: $stepCount, weather: $weather, memo: $memo, moodDate: $moodDate)';
  }
}

/// @nodoc
abstract mixin class $MoodPointCopyWith<$Res> {
  factory $MoodPointCopyWith(MoodPoint value, $Res Function(MoodPoint) _then) =
      _$MoodPointCopyWithImpl;
  @useResult
  $Res call(
      {String pointId,
      int point,
      int plannedVolume,
      double? sleepHours,
      int? stepCount,
      List<Weather> weather,
      String? memo,
      DateTime moodDate});
}

/// @nodoc
class _$MoodPointCopyWithImpl<$Res> implements $MoodPointCopyWith<$Res> {
  _$MoodPointCopyWithImpl(this._self, this._then);

  final MoodPoint _self;
  final $Res Function(MoodPoint) _then;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointId = null,
    Object? point = null,
    Object? plannedVolume = null,
    Object? sleepHours = freezed,
    Object? stepCount = freezed,
    Object? weather = null,
    Object? memo = freezed,
    Object? moodDate = null,
  }) {
    return _then(_self.copyWith(
      pointId: null == pointId
          ? _self.pointId
          : pointId // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      plannedVolume: null == plannedVolume
          ? _self.plannedVolume
          : plannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
      sleepHours: freezed == sleepHours
          ? _self.sleepHours
          : sleepHours // ignore: cast_nullable_to_non_nullable
              as double?,
      stepCount: freezed == stepCount
          ? _self.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int?,
      weather: null == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      memo: freezed == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      moodDate: null == moodDate
          ? _self.moodDate
          : moodDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _MoodPoint implements MoodPoint {
  const _MoodPoint(
      {required this.pointId,
      required this.point,
      required this.plannedVolume,
      required this.sleepHours,
      required this.stepCount,
      required final List<Weather> weather,
      required this.memo,
      required this.moodDate})
      : _weather = weather;

  /// 気分値 ID
  @override
  final String pointId;

  /// 気分値
  @override
  final int point;

  /// 予定量
  @override
  final int plannedVolume;
// 睡眠時間
  @override
  final double? sleepHours;
// 歩数
  @override
  final int? stepCount;
// 天気
  final List<Weather> _weather;
// 天気
  @override
  List<Weather> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

// メモ
  @override
  final String? memo;

  /// 気分日
  @override
  final DateTime moodDate;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoodPointCopyWith<_MoodPoint> get copyWith =>
      __$MoodPointCopyWithImpl<_MoodPoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoodPoint &&
            (identical(other.pointId, pointId) || other.pointId == pointId) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.plannedVolume, plannedVolume) ||
                other.plannedVolume == plannedVolume) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours) &&
            (identical(other.stepCount, stepCount) ||
                other.stepCount == stepCount) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.moodDate, moodDate) ||
                other.moodDate == moodDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pointId,
      point,
      plannedVolume,
      sleepHours,
      stepCount,
      const DeepCollectionEquality().hash(_weather),
      memo,
      moodDate);

  @override
  String toString() {
    return 'MoodPoint(pointId: $pointId, point: $point, plannedVolume: $plannedVolume, sleepHours: $sleepHours, stepCount: $stepCount, weather: $weather, memo: $memo, moodDate: $moodDate)';
  }
}

/// @nodoc
abstract mixin class _$MoodPointCopyWith<$Res>
    implements $MoodPointCopyWith<$Res> {
  factory _$MoodPointCopyWith(
          _MoodPoint value, $Res Function(_MoodPoint) _then) =
      __$MoodPointCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String pointId,
      int point,
      int plannedVolume,
      double? sleepHours,
      int? stepCount,
      List<Weather> weather,
      String? memo,
      DateTime moodDate});
}

/// @nodoc
class __$MoodPointCopyWithImpl<$Res> implements _$MoodPointCopyWith<$Res> {
  __$MoodPointCopyWithImpl(this._self, this._then);

  final _MoodPoint _self;
  final $Res Function(_MoodPoint) _then;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pointId = null,
    Object? point = null,
    Object? plannedVolume = null,
    Object? sleepHours = freezed,
    Object? stepCount = freezed,
    Object? weather = null,
    Object? memo = freezed,
    Object? moodDate = null,
  }) {
    return _then(_MoodPoint(
      pointId: null == pointId
          ? _self.pointId
          : pointId // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      plannedVolume: null == plannedVolume
          ? _self.plannedVolume
          : plannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
      sleepHours: freezed == sleepHours
          ? _self.sleepHours
          : sleepHours // ignore: cast_nullable_to_non_nullable
              as double?,
      stepCount: freezed == stepCount
          ? _self.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int?,
      weather: null == weather
          ? _self._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      memo: freezed == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      moodDate: null == moodDate
          ? _self.moodDate
          : moodDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
