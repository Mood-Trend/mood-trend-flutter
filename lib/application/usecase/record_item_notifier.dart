import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/record_item.dart';
import '../../domain/enum/record_item_type.dart';

/// [RecordItemNotifier] は、記録する項目のリストを管理するクラス。
///
/// - [RecordItem] のリストを保持し、ユーザーがどの項目を記録するかを選択できるようにします。
class RecordItemNotifier extends Notifier<List<RecordItem>> {
  @override
  List<RecordItem> build() {
    return [
      /// 睡眠時間
      RecordItem(
          type: RecordItemType.sleep, selected: true), // TODO:selectedは仮置き

      /// 歩数
      RecordItem(
          type: RecordItemType.steps, selected: true), // TODO:selectedは仮置き

      /// 天気
      RecordItem(
          type: RecordItemType.weather, selected: true), // TODO:selectedは仮置き

      /// 一言メモ
      RecordItem(
          type: RecordItemType.memo, selected: true), // TODO:selectedは仮置き
    ];
  }

  /// [index] で指定された記録する項目の要否（selected）を切り替えます。
  /// 範囲外のindexが指定された場合は何もしません。
  void toggleSelection(int index) {
    state = List.generate(
      state.length,
      (i) => i == index
          ? state[i].copyWith(selected: !state[i].selected)
          : state[i],
    );
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
