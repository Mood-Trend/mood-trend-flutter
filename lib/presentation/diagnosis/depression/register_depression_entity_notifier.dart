import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'selected_depression_type_notifier.dart';
import 'self_input_depression_notifier.dart';
import 'entity/depression_worksheet.dart';

/// 選択された鬱のタイプと手入力内容をもとに、
/// [DepressionWorksheet] を生成・管理する [Notifier]
///
/// [selectedDepressionTypeProvider] と
/// [selfInputDepressionNotifierProvider] に依存しており、
/// それらの値が変化した場合は [refresh] を呼び出すことで再生成が可能。

class RegisterDepressionEntityNotifier
    extends AutoDisposeNotifier<DepressionWorksheet> {
  @override
  DepressionWorksheet build() {
    final param = ref.watch(selfInputDepressionNotifierProvider);
    final type = ref.watch(selectedDepressionTypeNotifierProvider);
    return DepressionWorksheetFactory.create(
      type,
      param.$1,
      param.$2,
      param.$3,
      param.$4,
      param.$5,
    );
  }

  /// 内部状態 [DepressionWorksheet] を最新の入力状態に基づいて再生成します。
  void refresh() {
    state = build();
  }
}

/// 鬱の自己診断におけるエンティティ [DepressionWorksheet] を提供するプロバイダー。
///
/// - [selectedDepressionTypeProvider]（選択された鬱のタイプ）
/// - [selfInputDepressionNotifierProvider]（ユーザーの手入力内容）
///
/// に依存しており、それらをもとに [DepressionWorksheet] を構築します。
final registerDepressionEntityNotifierProvider = NotifierProvider.autoDispose<
    RegisterDepressionEntityNotifier,
    DepressionWorksheet>(RegisterDepressionEntityNotifier.new);
