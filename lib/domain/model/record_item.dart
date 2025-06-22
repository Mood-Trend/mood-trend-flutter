import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/record_item_type.dart';

part 'record_item.freezed.dart';
part 'record_item.g.dart';

/// [RecordItem] は、記録する項目のモデルクラス
@freezed
abstract class RecordItem with _$RecordItem {
  /// [type]: 記録項目の種類
  /// [selected]: 選択状態（デフォルトはfalse）
  const factory RecordItem({
    required RecordItemType type,
    required bool selected,
  }) = _RecordItem;

  factory RecordItem.fromJson(Map<String, dynamic> json) =>
      _$RecordItemFromJson(json);
}
