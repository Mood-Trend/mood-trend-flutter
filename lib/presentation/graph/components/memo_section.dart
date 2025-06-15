import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

/// [MemoSection] は、メモを入力できるセクションです。
class MemoSection extends StatelessWidget {
  final String labelText;
  final String memo;
  final ValueChanged<String> onChanged;
  final int maxLength;

  const MemoSection({
    super.key,
    required this.labelText,
    required this.memo,
    required this.onChanged,
    this.maxLength = 300,
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
        TextField(
          maxLines: 5,
          maxLength: maxLength,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length <= maxLength) {
              onChanged(value);
            }
          },
          controller: TextEditingController(text: memo),
        ),
      ],
    );
  }
}
