import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/error_handler_mixin.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/entity/depression_worksheet.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/selected_depression_type_notifier.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/navigation_utils.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../register_diagnosis_page.dart';

/// 鬱のタイプを表示するテーブル画面
class DepressionTypeTablePage extends ConsumerWidget with ErrorHandlerMixin {
  const DepressionTypeTablePage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worksheet = DepressionWorksheetFactory.create(
      ref.watch(selectedDepressionTypeNotifierProvider),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Center(
                child: Text(
                  S.of(context).typeSuggestion,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.green.withValues(alpha: 0.4),
                  ),
                  child: Column(children: [
                    TableCell(
                      moodValue: '-1',
                      actionText: worksheet.minus_1,
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                      color: AppColors.white,
                    ),
                    TableCell(
                      moodValue: '-2',
                      actionText: worksheet.minus_2,
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                      color: AppColors.white,
                    ),
                    TableCell(
                      moodValue: '-3',
                      actionText: worksheet.minus_3,
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                      color: AppColors.white,
                    ),
                    TableCell(
                      moodValue: '-4',
                      actionText: worksheet.minus_4,
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                      color: AppColors.white,
                    ),
                    TableCell(
                      moodValue: '-5',
                      actionText: worksheet.minus_5,
                    ),
                  ]),
                ),
              ],
            ),
            Flexible(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: AppColors.white,
                    fixedSize: const Size(330, 60),
                  ),
                  onPressed: () async {
                    popCount++;
                    PageNavigator.push(context, RegisterDiagnosisPage(uid: uid))
                        .then((value) => popCount--);
                  },
                  child: Text(
                    S.of(context).next,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  const TableCell({
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
            // これがないと文字数が多い時にUIが崩れる
            height: 90,
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
