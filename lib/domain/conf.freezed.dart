// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Conf {
  /// Conf ID
  String get confId => throw _privateConstructorUsedError;

  /// ユーザーが入力できる最大の予定数
  int get maxPlannedVolume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfCopyWith<Conf> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfCopyWith<$Res> {
  factory $ConfCopyWith(Conf value, $Res Function(Conf) then) =
      _$ConfCopyWithImpl<$Res, Conf>;
  @useResult
  $Res call({String confId, int maxPlannedVolume});
}

/// @nodoc
class _$ConfCopyWithImpl<$Res, $Val extends Conf>
    implements $ConfCopyWith<$Res> {
  _$ConfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confId = null,
    Object? maxPlannedVolume = null,
  }) {
    return _then(_value.copyWith(
      confId: null == confId
          ? _value.confId
          : confId // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlannedVolume: null == maxPlannedVolume
          ? _value.maxPlannedVolume
          : maxPlannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfImplCopyWith<$Res> implements $ConfCopyWith<$Res> {
  factory _$$ConfImplCopyWith(
          _$ConfImpl value, $Res Function(_$ConfImpl) then) =
      __$$ConfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String confId, int maxPlannedVolume});
}

/// @nodoc
class __$$ConfImplCopyWithImpl<$Res>
    extends _$ConfCopyWithImpl<$Res, _$ConfImpl>
    implements _$$ConfImplCopyWith<$Res> {
  __$$ConfImplCopyWithImpl(_$ConfImpl _value, $Res Function(_$ConfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confId = null,
    Object? maxPlannedVolume = null,
  }) {
    return _then(_$ConfImpl(
      confId: null == confId
          ? _value.confId
          : confId // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlannedVolume: null == maxPlannedVolume
          ? _value.maxPlannedVolume
          : maxPlannedVolume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ConfImpl implements _Conf {
  const _$ConfImpl({required this.confId, required this.maxPlannedVolume});

  /// Conf ID
  @override
  final String confId;

  /// ユーザーが入力できる最大の予定数
  @override
  final int maxPlannedVolume;

  @override
  String toString() {
    return 'Conf(confId: $confId, maxPlannedVolume: $maxPlannedVolume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfImpl &&
            (identical(other.confId, confId) || other.confId == confId) &&
            (identical(other.maxPlannedVolume, maxPlannedVolume) ||
                other.maxPlannedVolume == maxPlannedVolume));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confId, maxPlannedVolume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfImplCopyWith<_$ConfImpl> get copyWith =>
      __$$ConfImplCopyWithImpl<_$ConfImpl>(this, _$identity);
}

abstract class _Conf implements Conf {
  const factory _Conf(
      {required final String confId,
      required final int maxPlannedVolume}) = _$ConfImpl;

  @override

  /// Conf ID
  String get confId;
  @override

  /// ユーザーが入力できる最大の予定数
  int get maxPlannedVolume;
  @override
  @JsonKey(ignore: true)
  _$$ConfImplCopyWith<_$ConfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
