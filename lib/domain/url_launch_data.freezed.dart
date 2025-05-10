// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_launch_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UrlLaunchData {
  String get urlString;
  LaunchMode get mode;

  /// Create a copy of UrlLaunchData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UrlLaunchDataCopyWith<UrlLaunchData> get copyWith =>
      _$UrlLaunchDataCopyWithImpl<UrlLaunchData>(
          this as UrlLaunchData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UrlLaunchData &&
            (identical(other.urlString, urlString) ||
                other.urlString == urlString) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, urlString, mode);

  @override
  String toString() {
    return 'UrlLaunchData(urlString: $urlString, mode: $mode)';
  }
}

/// @nodoc
abstract mixin class $UrlLaunchDataCopyWith<$Res> {
  factory $UrlLaunchDataCopyWith(
          UrlLaunchData value, $Res Function(UrlLaunchData) _then) =
      _$UrlLaunchDataCopyWithImpl;
  @useResult
  $Res call({String urlString, LaunchMode mode});
}

/// @nodoc
class _$UrlLaunchDataCopyWithImpl<$Res>
    implements $UrlLaunchDataCopyWith<$Res> {
  _$UrlLaunchDataCopyWithImpl(this._self, this._then);

  final UrlLaunchData _self;
  final $Res Function(UrlLaunchData) _then;

  /// Create a copy of UrlLaunchData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlString = null,
    Object? mode = null,
  }) {
    return _then(_self.copyWith(
      urlString: null == urlString
          ? _self.urlString
          : urlString // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as LaunchMode,
    ));
  }
}

/// @nodoc

class _UrlLaunchData extends UrlLaunchData {
  const _UrlLaunchData({required this.urlString, required this.mode})
      : super._();

  @override
  final String urlString;
  @override
  final LaunchMode mode;

  /// Create a copy of UrlLaunchData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UrlLaunchDataCopyWith<_UrlLaunchData> get copyWith =>
      __$UrlLaunchDataCopyWithImpl<_UrlLaunchData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UrlLaunchData &&
            (identical(other.urlString, urlString) ||
                other.urlString == urlString) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, urlString, mode);

  @override
  String toString() {
    return 'UrlLaunchData(urlString: $urlString, mode: $mode)';
  }
}

/// @nodoc
abstract mixin class _$UrlLaunchDataCopyWith<$Res>
    implements $UrlLaunchDataCopyWith<$Res> {
  factory _$UrlLaunchDataCopyWith(
          _UrlLaunchData value, $Res Function(_UrlLaunchData) _then) =
      __$UrlLaunchDataCopyWithImpl;
  @override
  @useResult
  $Res call({String urlString, LaunchMode mode});
}

/// @nodoc
class __$UrlLaunchDataCopyWithImpl<$Res>
    implements _$UrlLaunchDataCopyWith<$Res> {
  __$UrlLaunchDataCopyWithImpl(this._self, this._then);

  final _UrlLaunchData _self;
  final $Res Function(_UrlLaunchData) _then;

  /// Create a copy of UrlLaunchData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? urlString = null,
    Object? mode = null,
  }) {
    return _then(_UrlLaunchData(
      urlString: null == urlString
          ? _self.urlString
          : urlString // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as LaunchMode,
    ));
  }
}

// dart format on
