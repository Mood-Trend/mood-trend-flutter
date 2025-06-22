import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../utils/app_colors.dart';

/// [MemoSection] は、メモを入力できるセクションです。
class MemoSection extends HookWidget {
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
    final controller = useTextEditingController(text: memo);
    useEffect(() {
      if (controller.text != memo) {
        controller.text = memo;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      }
      return null;
    }, [memo]);
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
          controller: controller,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
