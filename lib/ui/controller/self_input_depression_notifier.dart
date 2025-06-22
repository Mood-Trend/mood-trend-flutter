import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユーザーが手入力した鬱症状の5項目（minus1〜minus5）を管理する [Notifier]
///
/// 各項目は `String?` 型で表され、初期状態はすべて `null`。
/// 入力があるたびに [update] を使って個別に更新できる。
/// 全てリセットしたい場合は [reset] を使用する。

class SelfInputDepressionNotifier
    extends AutoDisposeNotifier<(String?, String?, String?, String?, String?)> {
  @override
  (String?, String?, String?, String?, String?) build() =>
      (null, null, null, null, null);

  /// 入力された値をもとに各項目の状態を更新する。
  ///
  /// 渡されなかった項目は、現在の状態を維持する。
  void update({
    String? minus1,
    String? minus2,
    String? minus3,
    String? minus4,
    String? minus5,
  }) {
    state = (
      minus1 ?? state.$1,
      minus2 ?? state.$2,
      minus3 ?? state.$3,
      minus4 ?? state.$4,
      minus5 ?? state.$5,
    );
  }

  /// 全ての入力項目を `null` にリセットする。
  void reset() => state = (null, null, null, null, null);
}

/// 鬱症状の手入力データ（5項目）を保持・操作するプロバイダー。
///
/// 各項目は文字列（`String?`）で構成されており、
/// UI などで動的に入力値を保持する用途に使う。
final selfInputDepressionNotifierProvider = NotifierProvider.autoDispose<
    SelfInputDepressionNotifier, (String?, String?, String?, String?, String?)>(
  SelfInputDepressionNotifier.new,
);
