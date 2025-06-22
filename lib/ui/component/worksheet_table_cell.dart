import 'package:flutter/material.dart';

import '../style/app_text_styles.dart';

/// 気分値目安表のセル
class WorksheetTableCell extends StatelessWidget {
  const WorksheetTableCell({
    super.key,
    required this.moodValue,
    required this.actionText,
    this.height = 80,
    this.moodValueStyle,
    this.actionTextStyle,
  });

  /// 気分値（例: '+5', '-3'）
  final String moodValue;

  /// 気分値に対応する説明テキスト
  final String actionText;

  /// セルの高さ
  final double height;

  /// 気分値のテキストスタイル（指定しない場合はデフォルト値が使用される）
  final TextStyle? moodValueStyle;

  /// 説明テキストのスタイル（指定しない場合はデフォルト値が使用される）
  final TextStyle? actionTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            moodValue,
            style: moodValueStyle ?? const TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.left,
                        actionText,
                        style: actionTextStyle ?? AppTextStyles.body,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
