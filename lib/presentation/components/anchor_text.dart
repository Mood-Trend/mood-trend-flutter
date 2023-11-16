import 'package:flutter/material.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';

/// アンカーテキスト
class AnchorText extends StatelessWidget {
  const AnchorText(this.text, {super.key});

  final String text;

  static TextStyle anchorStyleText(BuildContext context) => TextStyle(
        decoration: TextDecoration.underline,
        color: Theme.of(context).colorScheme.outline,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: anchorStyleText(context),
    );
  }
}
