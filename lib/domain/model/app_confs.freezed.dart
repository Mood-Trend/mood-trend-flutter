// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_confs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfs {
  /// レビューメニューを表示するかどうか
  bool get isShowReviewMenu;

  /// iOS のレビュー URL
  String get reviewUrlIos;

  /// Android のレビュー URL
  String get reviewUrlAndroid;

  /// Create a copy of AppConfs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppConfsCopyWith<AppConfs> get copyWith =>
      _$AppConfsCopyWithImpl<AppConfs>(this as AppConfs, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppConfs &&
            (identical(other.isShowReviewMenu, isShowReviewMenu) ||
                other.isShowReviewMenu == isShowReviewMenu) &&
            (identical(other.reviewUrlIos, reviewUrlIos) ||
                other.reviewUrlIos == reviewUrlIos) &&
            (identical(other.reviewUrlAndroid, reviewUrlAndroid) ||
                other.reviewUrlAndroid == reviewUrlAndroid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isShowReviewMenu, reviewUrlIos, reviewUrlAndroid);

  @override
  String toString() {
    return 'AppConfs(isShowReviewMenu: $isShowReviewMenu, reviewUrlIos: $reviewUrlIos, reviewUrlAndroid: $reviewUrlAndroid)';
  }
}

/// @nodoc
abstract mixin class $AppConfsCopyWith<$Res> {
  factory $AppConfsCopyWith(AppConfs value, $Res Function(AppConfs) _then) =
      _$AppConfsCopyWithImpl;
  @useResult
  $Res call(
      {bool isShowReviewMenu, String reviewUrlIos, String reviewUrlAndroid});
}

/// @nodoc
class _$AppConfsCopyWithImpl<$Res> implements $AppConfsCopyWith<$Res> {
  _$AppConfsCopyWithImpl(this._self, this._then);

  final AppConfs _self;
  final $Res Function(AppConfs) _then;

  /// Create a copy of AppConfs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowReviewMenu = null,
    Object? reviewUrlIos = null,
    Object? reviewUrlAndroid = null,
  }) {
    return _then(_self.copyWith(
      isShowReviewMenu: null == isShowReviewMenu
          ? _self.isShowReviewMenu
          : isShowReviewMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      reviewUrlIos: null == reviewUrlIos
          ? _self.reviewUrlIos
          : reviewUrlIos // ignore: cast_nullable_to_non_nullable
              as String,
      reviewUrlAndroid: null == reviewUrlAndroid
          ? _self.reviewUrlAndroid
          : reviewUrlAndroid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AppConfs implements AppConfs {
  const _AppConfs(
      {required this.isShowReviewMenu,
      required this.reviewUrlIos,
      required this.reviewUrlAndroid});

  /// レビューメニューを表示するかどうか
  @override
  final bool isShowReviewMenu;

  /// iOS のレビュー URL
  @override
  final String reviewUrlIos;

  /// Android のレビュー URL
  @override
  final String reviewUrlAndroid;

  /// Create a copy of AppConfs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppConfsCopyWith<_AppConfs> get copyWith =>
      __$AppConfsCopyWithImpl<_AppConfs>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppConfs &&
            (identical(other.isShowReviewMenu, isShowReviewMenu) ||
                other.isShowReviewMenu == isShowReviewMenu) &&
            (identical(other.reviewUrlIos, reviewUrlIos) ||
                other.reviewUrlIos == reviewUrlIos) &&
            (identical(other.reviewUrlAndroid, reviewUrlAndroid) ||
                other.reviewUrlAndroid == reviewUrlAndroid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isShowReviewMenu, reviewUrlIos, reviewUrlAndroid);

  @override
  String toString() {
    return 'AppConfs(isShowReviewMenu: $isShowReviewMenu, reviewUrlIos: $reviewUrlIos, reviewUrlAndroid: $reviewUrlAndroid)';
  }
}

/// @nodoc
abstract mixin class _$AppConfsCopyWith<$Res>
    implements $AppConfsCopyWith<$Res> {
  factory _$AppConfsCopyWith(_AppConfs value, $Res Function(_AppConfs) _then) =
      __$AppConfsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isShowReviewMenu, String reviewUrlIos, String reviewUrlAndroid});
}

/// @nodoc
class __$AppConfsCopyWithImpl<$Res> implements _$AppConfsCopyWith<$Res> {
  __$AppConfsCopyWithImpl(this._self, this._then);

  final _AppConfs _self;
  final $Res Function(_AppConfs) _then;

  /// Create a copy of AppConfs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isShowReviewMenu = null,
    Object? reviewUrlIos = null,
    Object? reviewUrlAndroid = null,
  }) {
    return _then(_AppConfs(
      isShowReviewMenu: null == isShowReviewMenu
          ? _self.isShowReviewMenu
          : isShowReviewMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      reviewUrlIos: null == reviewUrlIos
          ? _self.reviewUrlIos
          : reviewUrlIos // ignore: cast_nullable_to_non_nullable
              as String,
      reviewUrlAndroid: null == reviewUrlAndroid
          ? _self.reviewUrlAndroid
          : reviewUrlAndroid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
