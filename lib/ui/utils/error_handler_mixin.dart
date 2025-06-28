import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_exception.dart';
import '../component/snackbars.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin ErrorHandlerMixin {
  Future<void> run(
    WidgetRef ref, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final scaffoldMessenger =
        ref.read(scaffoldMessengerKeyProvider).currentState;
    if (scaffoldMessenger == null) return;
    try {
      await action();
      if (successMessage.isEmpty) return;
      SuccessSnackBar.show(scaffoldMessenger, message: successMessage);
    } on AppException catch (e) {
      FailureSnackBar.show(scaffoldMessenger, message: e.toString());
    }
  }
}
