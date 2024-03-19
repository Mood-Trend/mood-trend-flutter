import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/l10n/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/self_input_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';
import '../register_diagnosis_page.dart';
import 'depression_type_table_page.dart';
import 'entity/depression_worksheet.dart';

/// 選択された鬱のタイプを提供する [StateProvider]
final selectedDepressionTypeProvider =
    StateProvider.autoDispose<DepressionType>(
  (_) => DepressionType.other,
);

/// 鬱のタイプの診断画面
class DepressionTypeDiagnosisPage extends ConsumerWidget {
  const DepressionTypeDiagnosisPage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDepressionType = ref.watch(selectedDepressionTypeProvider);
    ButtonStyle buttonStyle(DepressionType depressionType) {
      return OutlinedButton.styleFrom(
        backgroundColor: selectedDepressionType == depressionType
            ? AppColors.green.withOpacity(0.3)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(
          color: selectedDepressionType == depressionType
              ? AppColors.green
              : AppColors.grey,
          width: 1,
        ),
        fixedSize: const Size(145, 145),
        foregroundColor: AppColors.black,
        splashFactory: NoSplash.splashFactory,
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
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(selectedDepressionTypeProvider.notifier).update(
                            (_) => DepressionType.melancholy,
                          );
                    },
                    style: buttonStyle(DepressionType.melancholy),
                    child: Text(
                      S.of(context).typeMelancholy,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                      onPressed: () {
                        ref
                            .read(selectedDepressionTypeProvider.notifier)
                            .update((_) => DepressionType.poorThinking);
                      },
                      style: buttonStyle(DepressionType.poorThinking),
                      child: Text(
                        S.of(context).typePoorThinking,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                      onPressed: () {
                        ref
                            .read(selectedDepressionTypeProvider.notifier)
                            .update((_) => DepressionType.sleepDisorders);
                      },
                      style: buttonStyle(DepressionType.sleepDisorders),
                      child: Text(
                        S.of(context).typeSleepDisorder,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(selectedDepressionTypeProvider.notifier).update(
                            (_) => DepressionType.other,
                          );
                    },
                    style: buttonStyle(DepressionType.other),
                    child: Text(
                      S.of(context).typeOther,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    popCount++;
                    PageNavigator.push(
                      context,
                      ref.read(selectedDepressionTypeProvider) ==
                              DepressionType.other
                          ? SelfInputPage(isManic: false, uid: uid)
                          : DepressionTypeTablePage(uid: uid),
                    ).then((value) => popCount--);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: AppColors.white,
                    fixedSize: const Size(300, 60),
                  ),
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
