import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SavingType {
  /// 保存前
  none,

  /// 保存中
  saving,

  /// 保存完了
  saved,
}

class SavingStatusNotifier extends AutoDisposeNotifier<SavingType> {
  @override
  SavingType build() => SavingType.none;

  void setSaving() => state = SavingType.saving;

  void setSaved() => state = SavingType.saved;

  void reset() => state = SavingType.none;
}

final isSavingProvider =
    NotifierProvider.autoDispose<SavingStatusNotifier, SavingType>(
  SavingStatusNotifier.new,
);
