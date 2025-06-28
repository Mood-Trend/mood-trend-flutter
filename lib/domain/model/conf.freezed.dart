// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Conf {
  /// Conf ID
  String get confId;

  /// ユーザーが入力できる最大の予定数
  int get maxPlannedVolume;

  /// オンボーディング完了済みかどうか
  bool get isOnboardingCompleted;

  /// Create a copy of Conf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfCopyWith<Conf> get copyWith =>
      _$ConfCopyWithImpl<Conf>(this as Conf, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Conf &&
            (identical(other.confId, confId) || other.confId == confId) &&
            (identical(other.maxPlannedVolume, maxPlannedVolume) ||
                other.maxPlannedVolume == maxPlannedVolume) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, confId, maxPlannedVolume, isOnboardingCompleted);

  @override
  String toString() {
    return 'Conf(confId: $confId, maxPlannedVolume: $maxPlannedVolume, isOnboardingCompleted: $isOnboardingCompleted)';
  }
}

/// @nodoc
abstract mixin class $ConfCopyWith<$Res> {
  factory $ConfCopyWith(Conf value, $Res Function(Conf) _then) =
      _$ConfCopyWithImpl;
  @useResult
  $Res call({String confId, int maxPlannedVolume, bool isOnboardingCompleted});
}

/// @nodoc
class _$ConfCopyWithImpl<$Res> implements $ConfCopyWith<$Res> {
  _$ConfCopyWithImpl(this._self, this._then);

  final Conf _self;
  final $Res Function(Conf) _then;

  /// Create a copy of Conf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confId = null,
    Object? maxPlannedVolume = null,
    Object? isOnboardingCompleted = null,
  }) {
    return _then(_self.copyWith(
      confId: null == confId
          ? _self.confId
          : confId // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlannedVolume: null == maxPlannedVolume
          ? _self.maxPlannedVolume
          : maxPlannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _self.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Conf implements Conf {
  const _Conf(
      {required this.confId,
      required this.maxPlannedVolume,
      required this.isOnboardingCompleted});

  /// Conf ID
  @override
  final String confId;

  /// ユーザーが入力できる最大の予定数
  @override
  final int maxPlannedVolume;

  /// オンボーディング完了済みかどうか
  @override
  final bool isOnboardingCompleted;

  /// Create a copy of Conf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfCopyWith<_Conf> get copyWith =>
      __$ConfCopyWithImpl<_Conf>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conf &&
            (identical(other.confId, confId) || other.confId == confId) &&
            (identical(other.maxPlannedVolume, maxPlannedVolume) ||
                other.maxPlannedVolume == maxPlannedVolume) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, confId, maxPlannedVolume, isOnboardingCompleted);

  @override
  String toString() {
    return 'Conf(confId: $confId, maxPlannedVolume: $maxPlannedVolume, isOnboardingCompleted: $isOnboardingCompleted)';
  }
}

/// @nodoc
abstract mixin class _$ConfCopyWith<$Res> implements $ConfCopyWith<$Res> {
  factory _$ConfCopyWith(_Conf value, $Res Function(_Conf) _then) =
      __$ConfCopyWithImpl;
  @override
  @useResult
  $Res call({String confId, int maxPlannedVolume, bool isOnboardingCompleted});
}

/// @nodoc
class __$ConfCopyWithImpl<$Res> implements _$ConfCopyWith<$Res> {
  __$ConfCopyWithImpl(this._self, this._then);

  final _Conf _self;
  final $Res Function(_Conf) _then;

  /// Create a copy of Conf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? confId = null,
    Object? maxPlannedVolume = null,
    Object? isOnboardingCompleted = null,
  }) {
    return _then(_Conf(
      confId: null == confId
          ? _self.confId
          : confId // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlannedVolume: null == maxPlannedVolume
          ? _self.maxPlannedVolume
          : maxPlannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _self.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
