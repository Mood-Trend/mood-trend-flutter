import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_trend_flutter/domain/models/record_item.dart';
import 'package:mood_trend_flutter/domain/models/record_item_type.dart';

final recordItemNotifierProvider =
    NotifierProvider<RecordItemNotifier, List<RecordItem>>(() {
  return RecordItemNotifier();
});

class RecordItemNotifier extends Notifier<List<RecordItem>> {
  @override
  List<RecordItem> build() {
    return [
      RecordItem(type: RecordItemType.sleep, selected: true),
      RecordItem(type: RecordItemType.steps),
      RecordItem(type: RecordItemType.weather, selected: true),
      RecordItem(type: RecordItemType.memo),
    ];
  }

  void toggleSelection(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(selected: !state[i].selected)
        else
          state[i],
    ];
  }
}
