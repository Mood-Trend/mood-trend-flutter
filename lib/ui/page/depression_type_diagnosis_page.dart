import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enum/depression_type.dart';
import '../../generated/l10n.dart';
import '../style/app_colors.dart';
import '../component/buttons.dart';
import '../router/navigation_service.dart';
import '../style/app_text_styles.dart';
import 'self_input_page.dart';
import 'depression_type_table_page.dart';
import '../controller/selected_depression_type_notifier.dart';

/// 鬱のタイプの診断画面
class DepressionTypeDiagnosisPage extends ConsumerWidget {
  const DepressionTypeDiagnosisPage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDepressionType =
        ref.watch(selectedDepressionTypeNotifierProvider);

    // 鬱タイプの選択ボタンを作成
    Widget buildTypeButton(DepressionType type, String label) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButtons.outlined(
          onPressed: () {
            ref
                .read(selectedDepressionTypeNotifierProvider.notifier)
                .select(type);
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
                      ref.read(selectedDepressionTypeNotifierProvider) ==
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
