import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/state/overlay_loading_provider.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin UsecaseMixin {
  Future<T> run<T>(Ref ref, Future<T> Function() action) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
