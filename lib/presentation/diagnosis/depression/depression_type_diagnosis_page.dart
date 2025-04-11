import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/components/buttons.dart';
import 'package:mood_trend_flutter/presentation/common/navigation/navigation_service.dart';
import 'package:mood_trend_flutter/presentation/common/theme/app_text_styles.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/providers/diagnosis_providers.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/self_input_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'depression_type_table_page.dart';
import 'entity/depression_worksheet.dart';

/// 鬱のタイプの診断画面
class DepressionTypeDiagnosisPage extends ConsumerWidget {
  const DepressionTypeDiagnosisPage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDepressionType = ref.watch(selectedDepressionTypeProvider);

    // 鬱タイプの選択ボタンを作成
    Widget buildTypeButton(DepressionType type, String label) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButtons.outlined(
          onPressed: () {
            ref
                .read(selectedDepressionTypeProvider.notifier)
                .update((_) => type);
          },
          isSelected: selectedDepressionType == type,
          fixedSize: const Size(145, 145),
          child: Text(
            label,
            style: AppTextStyles.body,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).typeDepression,
              style: AppTextStyles.heading,
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTypeButton(
                    DepressionType.melancholy, S.of(context).typeMelancholy),
                buildTypeButton(DepressionType.poorThinking,
                    S.of(context).typePoorThinking),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTypeButton(DepressionType.sleepDisorders,
                    S.of(context).typeSleepDisorder),
                buildTypeButton(DepressionType.other, S.of(context).typeOther),
              ],
            ),
            Flexible(
              child: Center(
                child: AppButtons.primary(
                  onPressed: () {
                    NavigationService.push(
                      context,
                      ref.read(selectedDepressionTypeProvider) ==
                              DepressionType.other
                          ? SelfInputPage(isManic: false, uid: uid)
                          : DepressionTypeTablePage(uid: uid),
                    );
                  },
                  fixedSize: const Size(300, 60),
                  child: Text(
                    S.of(context).next,
                    style: AppTextStyles.buttonText,
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
