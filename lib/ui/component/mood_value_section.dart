import 'package:flutter/material.dart';
import '../style/app_colors.dart';

/// [MoodValueSection] は,気分値を表示し、スライダーで調整できるセクションです。
class MoodValueSection extends StatelessWidget {
  final double moodValue;
  final ValueChanged<double> onChanged;
  final String labelText;
  final String tooltipMessage;
  final VoidCallback onTablePageTap;
  final String goTableLabel;

  const MoodValueSection({
    super.key,
    required this.moodValue,
    required this.onChanged,
    required this.labelText,
    required this.tooltipMessage,
    required this.onTablePageTap,
    required this.goTableLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Tooltip(
              showDuration: const Duration(seconds: 3),
              triggerMode: TooltipTriggerMode.tap,
              message: tooltipMessage,
              child: GestureDetector(
                child: const Icon(
                  Icons.help,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Slider(
          value: moodValue,
          min: -5.0,
          max: 5.0,
          divisions: 10,
          onChanged: (value) {
            if (value != 0.0) {
              onChanged(value);
            }
          },
        ),
        SizedBox(
          width: 75,
          child: Center(
            child: Text(
              moodValue.toInt().toString(),
              style: const TextStyle(fontSize: 52),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: onTablePageTap,
              label: Center(
                child: Text(
                  goTableLabel,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                  ),
                ),
              ),
              iconAlignment: IconAlignment.end,
              icon: Icon(
                Icons.arrow_right,
                color: AppColors.black,
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
