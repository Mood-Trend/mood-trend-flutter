import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/components/loading.dart';

import '../../domain/app_exception.dart';
import '../components/snackbars.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context,
    WidgetRef ref, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final isShowSnackBar = successMessage.isNotEmpty;
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      await action();
      if (!isShowSnackBar) return;
      SuccessSnackBar.show(
        ScaffoldMessenger.of(context),
        message: successMessage,
      );
    } on AppException catch (e) {
      if (!isShowSnackBar) return;
      FailureSnackBar.show(
        ScaffoldMessenger.of(context),
        message: e.toString(),
      );
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
