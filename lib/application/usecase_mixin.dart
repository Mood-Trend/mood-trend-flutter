import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/graph/states/is_saving_provider.dart';

import 'common/states/overlay_loading_provider.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin UsecaseMixin {
  Future<T> run<T>(
    Ref ref, {
    required Future<T> Function() action,
    bool isOverlayLoading = true,
  }) async {
    isOverlayLoading
        ? ref.read(overlayLoadingProvider.notifier).update((_) => true)
        : ref.read(isSavingProvider.notifier).update((_) => SavingType.saving);
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      isOverlayLoading
          ? ref.read(overlayLoadingProvider.notifier).update((_) => false)
          : ref.read(isSavingProvider.notifier).update((_) => SavingType.saved);
    }
  }
}
