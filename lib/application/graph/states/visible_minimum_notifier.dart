import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'selected_term_notifier.dart';

/// グラフの最小表示日を計算する [Notifier]
///
/// - [Term] の状態に応じて、表示期間の開始日を計算
class VisibleMinimumNotifier extends AutoDisposeNotifier<DateTime> {
  @override
  DateTime build() {
    final term = ref.watch(selectedTermNotifierProvider);
    return switch (term) {
      Term.month => DateTime.now().subtract(const Duration(days: 30)),
      Term.halfYear => DateTime.now().subtract(const Duration(days: 182)),
      Term.year => DateTime.now().subtract(const Duration(days: 365)),
    };
  }

  /// 状態を再計算して更新する
  void refresh() => state = build();
}

final visibleMinimumNotifierProvider =
    NotifierProvider.autoDispose<VisibleMinimumNotifier, DateTime>(
  VisibleMinimumNotifier.new,
);
