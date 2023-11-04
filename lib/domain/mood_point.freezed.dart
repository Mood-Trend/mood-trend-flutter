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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoodPoint {
  /// 気分値 ID
  String get pointId => throw _privateConstructorUsedError;

  /// 気分値
  int get point => throw _privateConstructorUsedError;

  /// 予定量
  int get plannedVolume => throw _privateConstructorUsedError;

  /// 気分日
  DateTime get moodDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodPointCopyWith<MoodPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodPointCopyWith<$Res> {
  factory $MoodPointCopyWith(MoodPoint value, $Res Function(MoodPoint) then) =
      _$MoodPointCopyWithImpl<$Res, MoodPoint>;
  @useResult
  $Res call({String pointId, int point, int plannedVolume, DateTime moodDate});
}

/// @nodoc
class _$MoodPointCopyWithImpl<$Res, $Val extends MoodPoint>
    implements $MoodPointCopyWith<$Res> {
  _$MoodPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointId = null,
    Object? point = null,
    Object? plannedVolume = null,
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
  $Res call({String pointId, int point, int plannedVolume, DateTime moodDate});
}

/// @nodoc
class __$$MoodPointImplCopyWithImpl<$Res>
    extends _$MoodPointCopyWithImpl<$Res, _$MoodPointImpl>
    implements _$$MoodPointImplCopyWith<$Res> {
  __$$MoodPointImplCopyWithImpl(
      _$MoodPointImpl _value, $Res Function(_$MoodPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointId = null,
    Object? point = null,
    Object? plannedVolume = null,
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
      required this.moodDate});

  /// 気分値 ID
  @override
  final String pointId;

  /// 気分値
  @override
  final int point;

  /// 予定量
  @override
  final int plannedVolume;

  /// 気分日
  @override
  final DateTime moodDate;

  @override
  String toString() {
    return 'MoodPoint(pointId: $pointId, point: $point, plannedVolume: $plannedVolume, moodDate: $moodDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodPointImpl &&
            (identical(other.pointId, pointId) || other.pointId == pointId) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.plannedVolume, plannedVolume) ||
                other.plannedVolume == plannedVolume) &&
            (identical(other.moodDate, moodDate) ||
                other.moodDate == moodDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pointId, point, plannedVolume, moodDate);

  @JsonKey(ignore: true)
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
      required final DateTime moodDate}) = _$MoodPointImpl;

  @override

  /// 気分値 ID
  String get pointId;
  @override

  /// 気分値
  int get point;
  @override

  /// 予定量
  int get plannedVolume;
  @override

  /// 気分日
  DateTime get moodDate;
  @override
  @JsonKey(ignore: true)
  _$$MoodPointImplCopyWith<_$MoodPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
