// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoodPoint {
  /// 気分値 ID
  String get pointId => throw _privateConstructorUsedError;

  /// 気分値
  int get point => throw _privateConstructorUsedError;

  /// 予定量
  int get plannedVolume => throw _privateConstructorUsedError; // 睡眠時間
  double get sleepHours => throw _privateConstructorUsedError; // 歩数
  int get stepCount => throw _privateConstructorUsedError; // 天気
  List<String> get weather =>
      throw _privateConstructorUsedError; //required String weather,
// メモ
  String get memo => throw _privateConstructorUsedError;

  /// 気分日
  DateTime get moodDate => throw _privateConstructorUsedError;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodPointCopyWith<MoodPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodPointCopyWith<$Res> {
  factory $MoodPointCopyWith(MoodPoint value, $Res Function(MoodPoint) then) =
      _$MoodPointCopyWithImpl<$Res, MoodPoint>;
  @useResult
  $Res call(
      {String pointId,
      int point,
      int plannedVolume,
      double sleepHours,
      int stepCount,
      List<String> weather,
      String memo,
      DateTime moodDate});
}

/// @nodoc
class _$MoodPointCopyWithImpl<$Res, $Val extends MoodPoint>
    implements $MoodPointCopyWith<$Res> {
  _$MoodPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointId = null,
    Object? point = null,
    Object? plannedVolume = null,
    Object? sleepHours = null,
    Object? stepCount = null,
    Object? weather = null,
    Object? memo = null,
    Object? moodDate = null,
  }) {
    return _then(_value.copyWith(
      pointId: null == pointId
          ? _value.pointId
          : pointId // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      plannedVolume: null == plannedVolume
          ? _value.plannedVolume
          : plannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
      sleepHours: null == sleepHours
          ? _value.sleepHours
          : sleepHours // ignore: cast_nullable_to_non_nullable
              as double,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      moodDate: null == moodDate
          ? _value.moodDate
          : moodDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodPointImplCopyWith<$Res>
    implements $MoodPointCopyWith<$Res> {
  factory _$$MoodPointImplCopyWith(
          _$MoodPointImpl value, $Res Function(_$MoodPointImpl) then) =
      __$$MoodPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pointId,
      int point,
      int plannedVolume,
      double sleepHours,
      int stepCount,
      List<String> weather,
      String memo,
      DateTime moodDate});
}

/// @nodoc
class __$$MoodPointImplCopyWithImpl<$Res>
    extends _$MoodPointCopyWithImpl<$Res, _$MoodPointImpl>
    implements _$$MoodPointImplCopyWith<$Res> {
  __$$MoodPointImplCopyWithImpl(
      _$MoodPointImpl _value, $Res Function(_$MoodPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointId = null,
    Object? point = null,
    Object? plannedVolume = null,
    Object? sleepHours = null,
    Object? stepCount = null,
    Object? weather = null,
    Object? memo = null,
    Object? moodDate = null,
  }) {
    return _then(_$MoodPointImpl(
      pointId: null == pointId
          ? _value.pointId
          : pointId // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      plannedVolume: null == plannedVolume
          ? _value.plannedVolume
          : plannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
      sleepHours: null == sleepHours
          ? _value.sleepHours
          : sleepHours // ignore: cast_nullable_to_non_nullable
              as double,
      stepCount: null == stepCount
          ? _value.stepCount
          : stepCount // ignore: cast_nullable_to_non_nullable
              as int,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      moodDate: null == moodDate
          ? _value.moodDate
          : moodDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$MoodPointImpl implements _MoodPoint {
  const _$MoodPointImpl(
      {required this.pointId,
      required this.point,
      required this.plannedVolume,
      required this.sleepHours,
      required this.stepCount,
      required final List<String> weather,
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
  final double sleepHours;
// 歩数
  @override
  final int stepCount;
// 天気
  final List<String> _weather;
// 天気
  @override
  List<String> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

//required String weather,
// メモ
  @override
  final String memo;

  /// 気分日
  @override
  final DateTime moodDate;

  @override
  String toString() {
    return 'MoodPoint(pointId: $pointId, point: $point, plannedVolume: $plannedVolume, sleepHours: $sleepHours, stepCount: $stepCount, weather: $weather, memo: $memo, moodDate: $moodDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodPointImpl &&
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

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodPointImplCopyWith<_$MoodPointImpl> get copyWith =>
      __$$MoodPointImplCopyWithImpl<_$MoodPointImpl>(this, _$identity);
}

abstract class _MoodPoint implements MoodPoint {
  const factory _MoodPoint(
      {required final String pointId,
      required final int point,
      required final int plannedVolume,
      required final double sleepHours,
      required final int stepCount,
      required final List<String> weather,
      required final String memo,
      required final DateTime moodDate}) = _$MoodPointImpl;

  /// 気分値 ID
  @override
  String get pointId;

  /// 気分値
  @override
  int get point;

  /// 予定量
  @override
  int get plannedVolume; // 睡眠時間
  @override
  double get sleepHours; // 歩数
  @override
  int get stepCount; // 天気
  @override
  List<String> get weather; //required String weather,
// メモ
  @override
  String get memo;

  /// 気分日
  @override
  DateTime get moodDate;

  /// Create a copy of MoodPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodPointImplCopyWith<_$MoodPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
