import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_colors.dart';

// appBarのタイトルに表示する日付選択ボタン
class DatePickerTtileButton extends StatelessWidget {
  final DateTime date;
  final ValueChanged<DateTime> onDateChanged;

  const DatePickerTtileButton({
    super.key,
    required this.date,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.green, // 背景色のテーマや選択時の背景色、キャンセルOKボタンの色
                  onPrimary: AppColors.white, // 選択時のテキストカラー
                  surface: AppColors.white, // カレンダーの背景色
                  onSurface: AppColors.black, // カレンダーのテキストカラー
                  surfaceTint: Colors.transparent, // カレンダーの背景にうっすらかかる色
                ),
              ),
              child: child!,
            );
          },
        );
        if (selectedDate != null) {
          onDateChanged(selectedDate);
        }
      },
      icon: Icon(
        Icons.arrow_drop_down,
        size: 24,
        color: AppColors.black,
      ),
      label: Text(
        DateFormat('yyyy/MM/dd').format(date),
        style: TextStyle(
          color: AppColors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
