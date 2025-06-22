// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordItem {
  RecordItemType get type;
  bool get selected;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecordItemCopyWith<RecordItem> get copyWith =>
      _$RecordItemCopyWithImpl<RecordItem>(this as RecordItem, _$identity);

  /// Serializes this RecordItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecordItem &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, selected);

  @override
  String toString() {
    return 'RecordItem(type: $type, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $RecordItemCopyWith<$Res> {
  factory $RecordItemCopyWith(
          RecordItem value, $Res Function(RecordItem) _then) =
      _$RecordItemCopyWithImpl;
  @useResult
  $Res call({RecordItemType type, bool selected});
}

/// @nodoc
class _$RecordItemCopyWithImpl<$Res> implements $RecordItemCopyWith<$Res> {
  _$RecordItemCopyWithImpl(this._self, this._then);

  final RecordItem _self;
  final $Res Function(RecordItem) _then;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? selected = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecordItemType,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RecordItem implements RecordItem {
  const _RecordItem({required this.type, required this.selected});
  factory _RecordItem.fromJson(Map<String, dynamic> json) =>
      _$RecordItemFromJson(json);

  @override
  final RecordItemType type;
  @override
  final bool selected;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecordItemCopyWith<_RecordItem> get copyWith =>
      __$RecordItemCopyWithImpl<_RecordItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecordItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecordItem &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, selected);

  @override
  String toString() {
    return 'RecordItem(type: $type, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$RecordItemCopyWith<$Res>
    implements $RecordItemCopyWith<$Res> {
  factory _$RecordItemCopyWith(
          _RecordItem value, $Res Function(_RecordItem) _then) =
      __$RecordItemCopyWithImpl;
  @override
  @useResult
  $Res call({RecordItemType type, bool selected});
}

/// @nodoc
class __$RecordItemCopyWithImpl<$Res> implements _$RecordItemCopyWith<$Res> {
  __$RecordItemCopyWithImpl(this._self, this._then);

  final _RecordItem _self;
  final $Res Function(_RecordItem) _then;

  /// Create a copy of RecordItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? selected = null,
  }) {
    return _then(_RecordItem(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as RecordItemType,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
