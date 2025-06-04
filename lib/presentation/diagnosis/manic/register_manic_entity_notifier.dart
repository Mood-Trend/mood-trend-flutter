import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/manic_worksheet.dart';
import 'selected_manic_type_notifier.dart';
import 'self_input_manic_notifier.dart';

/// 躁の自己入力内容と選択されたタイプをもとに、[ManicWorksheet] エンティティを生成・管理する [Notifier]
///
/// - [selfInputManicNotifierProvider]（ユーザーの入力値）
/// - [selectedManicTypeNotifierProvider]（選択された躁のタイプ）
///
/// に依存しており、これらの状態に基づいて [ManicWorksheetFactory] を用いてエンティティを構築する。
///
/// 状態の再構築を明示的に行いたい場合は [refresh] メソッドを使用する。
class RegisterManicEntityNotifier extends AutoDisposeNotifier<ManicWorksheet> {
  /// 初期状態の構築。現在の入力値と選択タイプから [ManicWorksheet] を生成する。
  @override
  ManicWorksheet build() {
    final param = ref.watch(selfInputManicNotifierProvider);
    final type = ref.watch(selectedManicTypeNotifierProvider);
    return ManicWorksheetFactory.create(
      type,
      param.$1,
      param.$2,
      param.$3,
      param.$4,
      param.$5,
    );
  }

  /// 現在の入力値と選択状態をもとに、状態（[ManicWorksheet]）を再生成する。
  ///
  /// フォーム更新後や、手動リフレッシュ時に利用する。
  void refresh() {
    state = build();
  }
}

/// 登録用の躁エンティティ [ManicWorksheet] を提供する [NotifierProvider]
///
/// - 入力データ： [selfInputManicNotifierProvider]
/// - タイプ選択： [selectedManicTypeNotifierProvider]
///
/// に基づいて、自動的に状態が構築される。UI などから watch して使用する。
final registerManicEntityNotifierProvider =
    NotifierProvider.autoDispose<RegisterManicEntityNotifier, ManicWorksheet>(
  RegisterManicEntityNotifier.new,
);
