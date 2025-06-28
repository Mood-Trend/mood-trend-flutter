import 'package:flutter/material.dart';

import '../style/app_colors.dart';

/// アプリ全体で使用される共通のボタンスタイルを提供するクラス
class AppButtons {
  /// プライマリボタン（緑色の塗りつぶしボタン）
  static ElevatedButton primary({
    required VoidCallback onPressed,
    required Widget child,
    Size? fixedSize,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        fixedSize: fixedSize,
      ),
      child: child,
    );
  }

  /// セカンダリボタン（透明背景のテキストボタン）
  static TextButton secondary({
    required VoidCallback onPressed,
    required Widget child,
    bool isSelected = false,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isSelected ? AppColors.green : Colors.transparent,
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.black,
          fontSize: 20,
        ),
        child: child,
      ),
    );
  }

  /// アウトラインボタン（枠線のみのボタン）
  static OutlinedButton outlined({
    required VoidCallback onPressed,
    required Widget child,
    bool isSelected = false,
    Size? fixedSize,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.green.withValues(alpha: 0.3)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(
          color: isSelected ? AppColors.green : AppColors.grey,
          width: 1,
        ),
        fixedSize: fixedSize,
        foregroundColor: AppColors.black,
        splashFactory: NoSplash.splashFactory,
      ),
      child: child,
    );
  }

  /// カスタムアウトラインボタン（枠線のみ、radius 8, 66x40）
  static OutlinedButton customOutline({
    required VoidCallback onPressed,
    required Widget child,
    bool isSelected = false,
    Size? fixedSize,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.green.withValues(alpha: 0.3)
            : Colors.transparent,
        side: BorderSide(
          color: isSelected ? AppColors.green : AppColors.grey,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: fixedSize,
      ),
      child: child,
    );
  }

  /// フローティングアクションボタン
  static FloatingActionButton floatingAction({
    required VoidCallback onPressed,
    required Widget child,
    Key? key,
  }) {
    return FloatingActionButton(
      key: key,
      backgroundColor: AppColors.green,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
