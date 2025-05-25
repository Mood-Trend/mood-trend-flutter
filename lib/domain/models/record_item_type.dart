// 記録項目の種類を表すenum
enum RecordItemType {
  // 睡眠時間
  sleep("睡眠時間"),
  // 歩数
  steps("歩数"),
  // 天気
  weather("天気"),
  // 一言メモ
  memo("一言メモ");

  const RecordItemType(this.label);
  final String label;

  static final Map<String, RecordItemType> _map = {
    for (final item in RecordItemType.values) item.label: item
  };

  /// ラベルから対応するRecordItemTypeを取得
  /// [label] ラベル文字列
  /// 存在しない場合は[RecordItemType.sleep]を返す
  static RecordItemType fromLabel(String value) {
    return _map[value] ?? RecordItemType.sleep;
  }
}
