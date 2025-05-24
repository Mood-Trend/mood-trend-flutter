import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/graph/states/saving_status_notifier.dart';

import 'common/states/overlay_loading_notifier.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin UsecaseMixin {
  Future<T> run<T>(
    Ref ref, {
    required Future<T> Function() action,
    bool isOverlayLoading = true,
  }) async {
    isOverlayLoading
        ? ref.read(overlayLoadingNotifierProvider.notifier).show()
        : ref.read(isSavingProvider.notifier).setSaving();
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      isOverlayLoading
          ? ref.read(overlayLoadingNotifierProvider.notifier).hide()
          : ref.read(isSavingProvider.notifier).setSaved();
    }
  }
}
