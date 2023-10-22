import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldMessengerKeyProvider =
    Provider((_) => GlobalKey<ScaffoldMessengerState>());

/// 処理成功用の [SnackBar]
class SuccessSnackBar extends SnackBar {
  SuccessSnackBar._({required String message})
      : super(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(SuccessSnackBar._(message: message));
  }
}

/// 処理失敗用の [SnackBar]
class FailureSnackBar extends SnackBar {
  FailureSnackBar._({required String message})
      : super(
          content: Text(message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(FailureSnackBar._(message: message));
  }
}
