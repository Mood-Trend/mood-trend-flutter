import 'package:flutter/material.dart';

/// 画面遷移を管理するサービス
class NavigationService {
  /// 新しい画面に遷移する
  static Future<T?> push<T>(
    BuildContext context,
    Widget page, {
    String? routeName,
  }) async {
    // 遷移履歴を記録する場合はここでプロバイダーを更新
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  /// 下から上にスライドするアニメーションで新しい画面に遷移する
  static Future<T?> pushWithSlideFromBottom<T>(
    BuildContext context,
    Widget page, {
    String? routeName,
  }) async {
    return Navigator.of(context).push<T>(
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  /// 条件に合致するまで画面を戻る
  static Future<void> popUntil(
    BuildContext context, {
    required bool Function(Route<dynamic>) predicate,
  }) async {
    Navigator.of(context).popUntil(predicate);
  }

  /// 指定した回数だけ画面を戻る
  static Future<void> popTimes(
    BuildContext context, {
    required int count,
  }) async {
    int poppedCount = 0;
    Navigator.of(context).popUntil((_) => poppedCount++ >= count);
  }

  /// 現在の画面を閉じる
  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }
}
