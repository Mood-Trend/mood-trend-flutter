// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppInfo {
  /// アプリ名
  String get appName;

  /// パッケージ名
  String get packageName;

  /// バージョン
  String get version;

  /// ビルド番号
  String get buildNumber;

  /// CopyRight
  String get copyRight;

  /// アイコン画像へのパス
  String get iconImagePath;

  /// プライバシーポリシーのURL
  Uri get privacyPolicyUrl;

  /// 利用規約のURL
  Uri get termsOfServiceUrl;

  /// コンタクトのURL
  Uri get contactUrl;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<AppInfo> get copyWith =>
      _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppInfo &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.copyRight, copyRight) ||
                other.copyRight == copyRight) &&
            (identical(other.iconImagePath, iconImagePath) ||
                other.iconImagePath == iconImagePath) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.termsOfServiceUrl, termsOfServiceUrl) ||
                other.termsOfServiceUrl == termsOfServiceUrl) &&
            (identical(other.contactUrl, contactUrl) ||
                other.contactUrl == contactUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appName,
      packageName,
      version,
      buildNumber,
      copyRight,
      iconImagePath,
      privacyPolicyUrl,
      termsOfServiceUrl,
      contactUrl);

  @override
  String toString() {
    return 'AppInfo(appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber, copyRight: $copyRight, iconImagePath: $iconImagePath, privacyPolicyUrl: $privacyPolicyUrl, termsOfServiceUrl: $termsOfServiceUrl, contactUrl: $contactUrl)';
  }
}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) =
      _$AppInfoCopyWithImpl;
  @useResult
  $Res call(
      {String appName,
      String packageName,
      String version,
      String buildNumber,
      String copyRight,
      String iconImagePath,
      Uri privacyPolicyUrl,
      Uri termsOfServiceUrl,
      Uri contactUrl});
}

/// @nodoc
class _$AppInfoCopyWithImpl<$Res> implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? packageName = null,
    Object? version = null,
    Object? buildNumber = null,
    Object? copyRight = null,
    Object? iconImagePath = null,
    Object? privacyPolicyUrl = null,
    Object? termsOfServiceUrl = null,
    Object? contactUrl = null,
  }) {
    return _then(_self.copyWith(
      appName: null == appName
          ? _self.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _self.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _self.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      copyRight: null == copyRight
          ? _self.copyRight
          : copyRight // ignore: cast_nullable_to_non_nullable
              as String,
      iconImagePath: null == iconImagePath
          ? _self.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _self.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _self.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      contactUrl: null == contactUrl
          ? _self.contactUrl
          : contactUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _AppInfo extends AppInfo {
  const _AppInfo(
      {required this.appName,
      required this.packageName,
      required this.version,
      required this.buildNumber,
      required this.copyRight,
      required this.iconImagePath,
      required this.privacyPolicyUrl,
      required this.termsOfServiceUrl,
      required this.contactUrl})
      : super._();

  /// アプリ名
  @override
  final String appName;

  /// パッケージ名
  @override
  final String packageName;

  /// バージョン
  @override
  final String version;

  /// ビルド番号
  @override
  final String buildNumber;

  /// CopyRight
  @override
  final String copyRight;

  /// アイコン画像へのパス
  @override
  final String iconImagePath;

  /// プライバシーポリシーのURL
  @override
  final Uri privacyPolicyUrl;

  /// 利用規約のURL
  @override
  final Uri termsOfServiceUrl;

  /// コンタクトのURL
  @override
  final Uri contactUrl;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppInfoCopyWith<_AppInfo> get copyWith =>
      __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppInfo &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.copyRight, copyRight) ||
                other.copyRight == copyRight) &&
            (identical(other.iconImagePath, iconImagePath) ||
                other.iconImagePath == iconImagePath) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.termsOfServiceUrl, termsOfServiceUrl) ||
                other.termsOfServiceUrl == termsOfServiceUrl) &&
            (identical(other.contactUrl, contactUrl) ||
                other.contactUrl == contactUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appName,
      packageName,
      version,
      buildNumber,
      copyRight,
      iconImagePath,
      privacyPolicyUrl,
      termsOfServiceUrl,
      contactUrl);

  @override
  String toString() {
    return 'AppInfo(appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber, copyRight: $copyRight, iconImagePath: $iconImagePath, privacyPolicyUrl: $privacyPolicyUrl, termsOfServiceUrl: $termsOfServiceUrl, contactUrl: $contactUrl)';
  }
}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) =
      __$AppInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String appName,
      String packageName,
      String version,
      String buildNumber,
      String copyRight,
      String iconImagePath,
      Uri privacyPolicyUrl,
      Uri termsOfServiceUrl,
      Uri contactUrl});
}

/// @nodoc
class __$AppInfoCopyWithImpl<$Res> implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appName = null,
    Object? packageName = null,
    Object? version = null,
    Object? buildNumber = null,
    Object? copyRight = null,
    Object? iconImagePath = null,
    Object? privacyPolicyUrl = null,
    Object? termsOfServiceUrl = null,
    Object? contactUrl = null,
  }) {
    return _then(_AppInfo(
      appName: null == appName
          ? _self.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _self.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _self.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      copyRight: null == copyRight
          ? _self.copyRight
          : copyRight // ignore: cast_nullable_to_non_nullable
              as String,
      iconImagePath: null == iconImagePath
          ? _self.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _self.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _self.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      contactUrl: null == contactUrl
          ? _self.contactUrl
          : contactUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

// dart format on
