import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SavingType {
  /// 保存前
  none,

  /// 保存中
  saving,

  /// 保存完了
  saved,

  /// 保存失敗
  failed,
}

final isSavingProvider = StateProvider.autoDispose<SavingType>(
  (_) => SavingType.none,
);
