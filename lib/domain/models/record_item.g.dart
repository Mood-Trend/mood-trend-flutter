// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecordItem _$RecordItemFromJson(Map<String, dynamic> json) => _RecordItem(
      type: $enumDecode(_$RecordItemTypeEnumMap, json['type']),
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$RecordItemToJson(_RecordItem instance) =>
    <String, dynamic>{
      'type': _$RecordItemTypeEnumMap[instance.type]!,
      'selected': instance.selected,
    };

const _$RecordItemTypeEnumMap = {
  RecordItemType.sleep: 'sleep',
  RecordItemType.steps: 'steps',
  RecordItemType.weather: 'weather',
  RecordItemType.memo: 'memo',
};
