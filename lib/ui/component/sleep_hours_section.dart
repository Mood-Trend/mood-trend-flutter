import 'package:flutter/material.dart';

/// [SleepHoursSection] は、睡眠時間を表示し、スライダーで調整できるセクションです。
class SleepHoursSection extends StatelessWidget {
  final double sleepHours;
  final ValueChanged<double> onChanged;
  final String labelText;

  const SleepHoursSection({
    super.key,
    required this.sleepHours,
    required this.onChanged,
    required this.labelText,
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
          ],
        ),
        const SizedBox(height: 16),
        Slider(
          label: null,
          min: 0,
          max: 16,
          value: sleepHours,
          divisions: 32, // 0.5刻み
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Center(
                      child: Text(
                        sleepHours.toString(),
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
