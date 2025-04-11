import 'package:flutter/material.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';

/// アプリ全体で使用される共通の区切り線を提供するクラス
class AppDividers {
  /// 標準的な区切り線
  static Divider standard({
    double indent = 16,
    double endIndent = 16,
    Color? color,
  }) {
    return Divider(
      height: 0,
      thickness: 1,
      indent: indent,
      endIndent: endIndent,
      color: color ?? AppColors.grey,
    );
  }

  /// 太い区切り線
  static Divider thick({
    double indent = 16,
    double endIndent = 16,
    Color? color,
  }) {
    return Divider(
      height: 0,
      thickness: 2,
      indent: indent,
      endIndent: endIndent,
      color: color ?? AppColors.white,
    );
  }
}
