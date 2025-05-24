import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'entity/manic_worksheet.dart';

/// ユーザーが選択した躁のタイプ [ManicType] を状態として保持する [Notifier]
///
/// 初期状態は [ManicType.other] に設定されており、
/// ユーザーの選択に応じて [select] メソッドで状態を変更する。
///
/// 他の診断フローや画面と連携し、選択状態に応じた分岐などを実装するために使用される。
class SelectedManicTypeNotifier extends AutoDisposeNotifier<ManicType> {
  @override
  ManicType build() => ManicType.other;

  /// ユーザーの選択した躁のタイプを設定する。
  ///
  /// 例: `select(ManicType.idea)`
  void select(ManicType type) => state = type;

  /// 選択状態をリセットし、[ManicType.other] に戻す。
  void reset() => state = ManicType.other;
}

/// 選択された躁のタイプ [ManicType] を提供するプロバイダー。
///
/// UI 層などで現在の躁のタイプを監視し、
/// ボタンのハイライト表示や次画面の遷移ロジックに利用される。
final selectedManicTypeNotifierProvider =
    NotifierProvider.autoDispose<SelectedManicTypeNotifier, ManicType>(
  SelectedManicTypeNotifier.new,
);
