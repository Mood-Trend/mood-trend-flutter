import 'package:flutter/material.dart';

/// [StepCountSection] は、歩数を表示し、スライダーで調整できるセクションです。
class StepCountSection extends StatelessWidget {
  final int stepCount;
  final ValueChanged<double> onChanged;
  final String labelText;

  const StepCountSection({
    super.key,
    required this.stepCount,
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
          max: 20000,
          value: stepCount.toDouble(),
          divisions: 16,
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 175,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Center(
                      child: Text(
                        stepCount.toInt().toString(),
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
