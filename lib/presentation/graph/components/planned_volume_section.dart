import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

/// [PlannedVolumeSection] は、計画の数を表示し、スライダーで調整できるセクションです。
class PlannedVolumeSection extends StatelessWidget {
  final double plannedValue;
  final ValueChanged<double> onChanged;
  final String labelText;
  final String tooltipMessage;

  const PlannedVolumeSection({
    super.key,
    required this.plannedValue,
    required this.onChanged,
    required this.labelText,
    required this.tooltipMessage,
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
              child: Icon(
                Icons.help,
                color: AppColors.grey,
                size: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Slider(
          label: null,
          min: 0,
          max: 16,
          value: plannedValue,
          divisions: 16,
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Center(
                      child: Text(
                        plannedValue.toInt().toString(),
                        style: const TextStyle(fontSize: 52),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
