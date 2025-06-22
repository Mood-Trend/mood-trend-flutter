import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enum/term.dart';

/// 現在選択されているグラフ期間 [Term] を管理する [Notifier]
///
/// - 初期値は [Term.month]
/// - UI などから `ref.watch(selectedTermNotifierProvider)` で現在の選択状態を取得
/// - `ref.read(selectedTermNotifierProvider.notifier).select(Term.year)` のようにして更新可能
/// - `reset()` を呼ぶことで初期状態（月）に戻す
class SelectedTermNotifier extends AutoDisposeNotifier<Term> {
  /// 初期状態を [Term.month] に設定
  @override
  Term build() => Term.month;

  /// 表示期間を選択された [term] に更新する
  void select(Term term) => state = term;

  /// 表示期間を初期状態（[Term.month]）にリセットする
  void reset() => state = Term.month;
}

/// 選択されたグラフ表示期間 [Term] を提供する [NotifierProvider]
///
/// - `watch` で現在の選択状態を取得
/// - `read().select(...)` や `read().reset()` により状態を更新可能
final selectedTermNotifierProvider =
    NotifierProvider.autoDispose<SelectedTermNotifier, Term>(
  SelectedTermNotifier.new,
);
