import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユーザーが手入力した躁状態（plus1〜plus5）の値を保持・管理する [Notifier]
///
/// 各項目は `String?` 型で構成され、初期状態はすべて `null`。
/// 入力値の更新は [update] メソッドで個別に行い、
/// すべての値をリセットしたい場合は [reset] を使用する。
class SelfInputManicNotifier
    extends AutoDisposeNotifier<(String?, String?, String?, String?, String?)> {
  /// 初期状態：すべて `null`
  @override
  (String?, String?, String?, String?, String?) build() =>
      (null, null, null, null, null);

  /// ユーザーが入力した躁状態の値を個別に更新する。
  ///
  /// 渡されなかった項目は現在の状態を維持する。
  ///
  /// 例：
  /// ```dart
  /// ref.read(selfInputManicNotifierProvider.notifier).update(
  ///   plus3: "ハイテンション",
  /// );
  /// ```
  void update({
    String? plus1,
    String? plus2,
    String? plus3,
    String? plus4,
    String? plus5,
  }) {
    state = (
      plus1 ?? state.$1,
      plus2 ?? state.$2,
      plus3 ?? state.$3,
      plus4 ?? state.$4,
      plus5 ?? state.$5,
    );
  }

  /// 全ての入力値を `null` にリセットする。
  ///
  /// フォームの初期化やクリア操作時に利用。
  void reset() => state = (null, null, null, null, null);
}

/// 躁状態の自己入力値を管理する [NotifierProvider]
///
/// 入力内容は `(String?, String?, String?, String?, String?)` のタプル形式で保持され、
/// 各項目は UI からの手入力によって更新される。
final selfInputManicNotifierProvider = NotifierProvider.autoDispose<
    SelfInputManicNotifier, (String?, String?, String?, String?, String?)>(
  SelfInputManicNotifier.new,
);
