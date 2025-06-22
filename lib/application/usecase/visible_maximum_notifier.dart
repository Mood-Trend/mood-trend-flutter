import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/utils/datetime_extension.dart';

/// グラフの最大表示日を提供する [Notifier]
///
/// - 現在日時をもとにグラフの右端日付を提供
class VisibleMaximumNotifier extends AutoDisposeNotifier<DateTime> {
  @override
  DateTime build() => DateTime.now().toDateOnly();

  /// 状態を再計算して更新する
  void refresh() => state = build();
}

final visibleMaximumNotifierProvider =
    NotifierProvider.autoDispose<VisibleMaximumNotifier, DateTime>(
  VisibleMaximumNotifier.new,
);
