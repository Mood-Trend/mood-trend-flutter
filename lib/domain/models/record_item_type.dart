enum RecordItemType {
  sleep("睡眠時間"),
  steps("歩数"),
  weather("天気"),
  memo("一言メモ");

  const RecordItemType(this.label);
  final String label;

  static final Map<String, RecordItemType> _map = {
    for (final item in RecordItemType.values) item.label: item
  };

  static RecordItemType fromLabel(String value) {
    return _map[value] ?? RecordItemType.sleep;
  }
}
