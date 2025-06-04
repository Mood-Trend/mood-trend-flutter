import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

/// アプリ全体で使用されるテキストスタイルを定義するクラス
class AppTextStyles {
  /// 見出し用の大きなテキストスタイル
  static const TextStyle heading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  /// サブ見出し用のテキストスタイル
  static const TextStyle subheading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  /// ボタン用のテキストスタイル
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  /// 通常のテキストスタイル
  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: Colors.black,
    height: 1.4,
  );

  /// 小さいテキストスタイル
  static const TextStyle small = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  /// 選択されたボタン用のテキストスタイル
  static TextStyle selectedButtonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  /// 選択されていないボタン用のテキストスタイル
  static TextStyle unselectedButtonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
}
