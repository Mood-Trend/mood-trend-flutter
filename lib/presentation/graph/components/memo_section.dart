import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

/// [MemoSection] は、メモを入力できるセクションです。
class MemoSection extends StatefulWidget {
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
  State<MemoSection> createState() => _MemoSectionState();
}

class _MemoSectionState extends State<MemoSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.memo);
    _controller.addListener(_handleTextChanged);
  }

  @override
  void didUpdateWidget(MemoSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.memo != widget.memo && _controller.text != widget.memo) {
      _controller.text = widget.memo;
    }
  }

  void _handleTextChanged() {
    if (_controller.text.length <= widget.maxLength) {
      widget.onChanged(_controller.text);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                widget.labelText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          maxLines: 5,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            counterText: '',
          ),
          controller: _controller,
        ),
      ],
    );
  }
}
