// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteCode {
  /// 招待コードのID
  String get id;

  /// 招待主のUID
  String get ownerUid;

  /// 有効期限
  DateTime get expiresAt;

  /// 使用済みかどうか
  bool get isUsed;

  /// Create a copy of InviteCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteCodeCopyWith<InviteCode> get copyWith =>
      _$InviteCodeCopyWithImpl<InviteCode>(this as InviteCode, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteCode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerUid, ownerUid) ||
                other.ownerUid == ownerUid) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, ownerUid, expiresAt, isUsed);

  @override
  String toString() {
    return 'InviteCode(id: $id, ownerUid: $ownerUid, expiresAt: $expiresAt, isUsed: $isUsed)';
  }
}

/// @nodoc
abstract mixin class $InviteCodeCopyWith<$Res> {
  factory $InviteCodeCopyWith(
          InviteCode value, $Res Function(InviteCode) _then) =
      _$InviteCodeCopyWithImpl;
  @useResult
  $Res call({String id, String ownerUid, DateTime expiresAt, bool isUsed});
}

/// @nodoc
class _$InviteCodeCopyWithImpl<$Res> implements $InviteCodeCopyWith<$Res> {
  _$InviteCodeCopyWithImpl(this._self, this._then);

  final InviteCode _self;
  final $Res Function(InviteCode) _then;

  /// Create a copy of InviteCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerUid = null,
    Object? expiresAt = null,
    Object? isUsed = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUid: null == ownerUid
          ? _self.ownerUid
          : ownerUid // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _self.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _InviteCode implements InviteCode {
  const _InviteCode(
      {required this.id,
      required this.ownerUid,
      required this.expiresAt,
      this.isUsed = false});

  /// 招待コードのID
  @override
  final String id;

  /// 招待主のUID
  @override
  final String ownerUid;

  /// 有効期限
  @override
  final DateTime expiresAt;

  /// 使用済みかどうか
  @override
  @JsonKey()
  final bool isUsed;

  /// Create a copy of InviteCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteCodeCopyWith<_InviteCode> get copyWith =>
      __$InviteCodeCopyWithImpl<_InviteCode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteCode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerUid, ownerUid) ||
                other.ownerUid == ownerUid) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, ownerUid, expiresAt, isUsed);

  @override
  String toString() {
    return 'InviteCode(id: $id, ownerUid: $ownerUid, expiresAt: $expiresAt, isUsed: $isUsed)';
  }
}

/// @nodoc
abstract mixin class _$InviteCodeCopyWith<$Res>
    implements $InviteCodeCopyWith<$Res> {
  factory _$InviteCodeCopyWith(
          _InviteCode value, $Res Function(_InviteCode) _then) =
      __$InviteCodeCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String ownerUid, DateTime expiresAt, bool isUsed});
}

/// @nodoc
class __$InviteCodeCopyWithImpl<$Res> implements _$InviteCodeCopyWith<$Res> {
  __$InviteCodeCopyWithImpl(this._self, this._then);

  final _InviteCode _self;
  final $Res Function(_InviteCode) _then;

  /// Create a copy of InviteCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ownerUid = null,
    Object? expiresAt = null,
    Object? isUsed = null,
  }) {
    return _then(_InviteCode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUid: null == ownerUid
          ? _self.ownerUid
          : ownerUid // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _self.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
