import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

/// 気分値目安表のセル
class WorksheetTableCell extends StatelessWidget {
  const WorksheetTableCell({
    super.key,
    required this.moodValue,
    required this.actionText,
  });
  final String moodValue;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            moodValue,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.left,
                        actionText,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.black,
                          height: 1.4,
                        ),
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
