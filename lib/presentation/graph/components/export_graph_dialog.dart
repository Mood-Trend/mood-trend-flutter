import 'package:flutter/material.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/graph_export_utils.dart';

class ExportGraphDialog extends StatefulWidget {
  const ExportGraphDialog({
    super.key,
    required this.onExport,
  });

  final Function(ExportFormat) onExport;

  @override
  State<ExportGraphDialog> createState() => _ExportGraphDialogState();
}

class _ExportGraphDialogState extends State<ExportGraphDialog> {
  ExportFormat _selectedFormat = ExportFormat.pdf;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      title: Text(S.of(context).exportAs),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<ExportFormat>(
            title: Text(S.of(context).pdf),
            value: ExportFormat.pdf,
            groupValue: _selectedFormat,
            onChanged: (ExportFormat? value) {
              setState(() {
                _selectedFormat = value!;
              });
            },
            activeColor: AppColors.green,
          ),
          RadioListTile<ExportFormat>(
            title: Text(S.of(context).png),
            value: ExportFormat.png,
            groupValue: _selectedFormat,
            onChanged: (ExportFormat? value) {
              setState(() {
                _selectedFormat = value!;
              });
            },
            activeColor: AppColors.green,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            S.of(context).cancel,
            style: TextStyle(color: AppColors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onExport(_selectedFormat);
          },
          child: Text(
            S.of(context).saveToDevice,
            style: TextStyle(color: AppColors.green),
          ),
        ),
      ],
    );
  }
}
