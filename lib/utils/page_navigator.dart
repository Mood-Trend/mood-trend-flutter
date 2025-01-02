import 'package:flutter/material.dart';

/// Navigator を扱いやすく Wrap したクラス
class PageNavigator {
  const PageNavigator._();

  /// 指定したページに遷移
  ///
  /// [context] - BuildContext を指定
  /// [page] - 遷移先のウィジェットを指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  /// [fullscreenDialog] - true の場合、遷移先をモーダルのフルスクリーンダイアログとして表示
  static Future<void> push(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator).push<void>(
      MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(
          name: page.toString(),
        ),
      ),
    );
  }

  /// 下からのスライドアニメーションで指定したページに遷移
  ///
  /// [context] - BuildContext を指定
  /// [page] - 遷移先のウィジェットを指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  static Future<void> pushWithSlideFromBottom(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator).push<void>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // 下から上への開始位置
          const end = Offset.zero; // 最終位置（中央）
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        settings: RouteSettings(
          name: page.toString(),
        ),
      ),
    );
  }

  /// 現在のページを新しいページに置換え
  ///
  /// [context] - BuildContext を指定
  /// [page] - 遷移先のウィジェットを指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  /// [fullscreenDialog] - true の場合、遷移先をモーダルのフルスクリーンダイアログとして表示
  static Future<void> pushReplacement(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushReplacement<void, void>(
      MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(
          name: page.toString(),
        ),
      ),
    );
  }

  /// 指定したページまで遷移し、それ以前のすべてのページを削除
  ///
  /// [context] - BuildContext を指定
  /// [page] - 遷移先のウィジェットを指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  /// [fullscreenDialog] - true の場合、遷移先をモーダルのフルスクリーンダイアログとして表示
  static Future<void> pushAndRemoveUntil(
    BuildContext context,
    Widget page, {
    bool rootNavigator = false,
    bool fullscreenDialog = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushAndRemoveUntil<void>(
      MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(
          name: page.toString(),
        ),
      ),
      (_) => false,
    );
  }

  /// 現在のページをポップして前のページに戻る
  ///
  /// [context] - BuildContext を指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  static Future<void> pop(
    BuildContext context, {
    bool rootNavigator = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator).pop();
  }

  /// 指定した条件が満たされるまでページをポップ
  ///
  /// [context] - BuildContext を指定
  /// [predicate] - ポップが停止する条件を指定する関数を指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  static Future<void> popUntil(
    BuildContext context, {
    required RoutePredicate predicate,
    bool rootNavigator = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .popUntil(predicate);
  }

  /// ナビゲーションスタックの最初のページまでページをポップ
  ///
  /// [context] - BuildContext を指定
  /// [rootNavigator] - true の場合、最上位の Navigator を使用
  static Future<void> popUntilRoot(
    BuildContext context, {
    bool rootNavigator = false,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .popUntil((route) => route.isFirst);
  }
}
