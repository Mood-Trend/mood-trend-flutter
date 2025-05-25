import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_trend_flutter/domain/models/record_item.dart';
import 'package:mood_trend_flutter/domain/models/record_item_type.dart';

/// [RecordItemNotifier] は、記録する項目のリストを管理するクラス。
///
/// - [RecordItem] のリストを保持し、ユーザーがどの項目を記録するかを選択できるようにします。
class RecordItemNotifier extends Notifier<List<RecordItem>> {
  @override
  List<RecordItem> build() {
    return [
      /// 睡眠時間
      RecordItem(type: RecordItemType.sleep, selected: true),

      /// 歩数
      RecordItem(type: RecordItemType.steps),

      /// 天気
      RecordItem(type: RecordItemType.weather, selected: true),

      /// 一言メモ
      RecordItem(type: RecordItemType.memo),
    ];
  }

  /// [index] で指定された記録する項目の要否（selected）を切り替えます。
  /// 範囲外のindexが指定された場合は何もしません。
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

/// 記録する項目 [RecordItem] のリスト状態を提供する [NotifierProvider]。
///
/// - このプロバイダーを通じて、アプリ全体で記録項目の選択状態を参照・更新できます。
/// - [RecordItemNotifier] を利用して、ユーザーがどの項目を記録するかを管理します。
final recordItemNotifierProvider =
    NotifierProvider<RecordItemNotifier, List<RecordItem>>(() {
  return RecordItemNotifier();
});
