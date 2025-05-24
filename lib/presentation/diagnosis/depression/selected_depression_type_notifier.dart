import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/entity/depression_worksheet.dart';

/// ユーザーが選択した鬱のタイプを管理する [Notifier]
///
/// - 初期状態は [DepressionType.other]
/// - [select] で状態を更新
/// - [reset] で初期状態に戻す
///
/// この状態は診断フローや登録画面などで参照され、
/// 選択に応じた分岐処理や表示切り替えに利用される。
class SelectedDepressionTypeNotifier
    extends AutoDisposeNotifier<DepressionType> {
  /// 初期状態を構築（未選択状態とみなす）
  @override
  DepressionType build() => DepressionType.other;

  /// 鬱のタイプをユーザーの選択に基づいて更新する
  ///
  /// 例:
  /// ```dart
  /// ref.read(selectedDepressionTypeNotifierProvider.notifier).select(DepressionType.idea);
  /// ```
  void select(DepressionType type) => state = type;

  /// 鬱のタイプを初期状態 [DepressionType.other] にリセットする
  void reset() => state = DepressionType.other;
}

/// 鬱のタイプを提供する [NotifierProvider]
///
/// - [watch] で現在の選択状態を取得
/// - `read().select(...)` や `read().reset()` で更新操作が可能
final selectedDepressionTypeNotifierProvider = NotifierProvider.autoDispose<
    SelectedDepressionTypeNotifier, DepressionType>(
  SelectedDepressionTypeNotifier.new,
);
