import 'package:freezed_annotation/freezed_annotation.dart';
import 'record_item_type.dart';

part 'record_item.freezed.dart';
part 'record_item.g.dart';

@freezed
abstract class RecordItem with _$RecordItem {
  const factory RecordItem({
    required RecordItemType type,
    @Default(false) bool selected,
  }) = _RecordItem;

  factory RecordItem.fromJson(Map<String, dynamic> json) =>
      _$RecordItemFromJson(json);
}
