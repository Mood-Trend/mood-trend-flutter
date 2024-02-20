import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/self_input_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';
import '../register_diagnosis_page.dart';
import 'entity/manic_worksheet.dart';
import 'manic_type_table_page.dart';

/// 選択された躁のタイプを提供する [StateProvider]
final selectedManicTypeProvider = StateProvider.autoDispose<ManicType>(
  (_) => ManicType.other,
);

/// 躁のタイプの診断画面
class ManicTypeDiagnosisPage extends ConsumerWidget {
  const ManicTypeDiagnosisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedManicType = ref.watch(selectedManicTypeProvider);
    ButtonStyle buttonStyle(ManicType manicType) {
      return OutlinedButton.styleFrom(
        backgroundColor: selectedManicType == manicType
            ? AppColors.green.withOpacity(0.3)
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(
          color:
              selectedManicType == manicType ? AppColors.green : AppColors.grey,
          width: 1,
        ),
        fixedSize: const Size(130, 130),
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
              S.of(context).typeManic,
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
                      ref.read(selectedManicTypeProvider.notifier).update(
                            (_) => ManicType.idea,
                          );
                    },
                    style: buttonStyle(ManicType.idea),
                    child: Text(
                      S.of(context).typeIdea,
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
                        ref.read(selectedManicTypeProvider.notifier).update(
                              (_) => ManicType.elation,
                            );
                      },
                      style: buttonStyle(ManicType.elation),
                      child: Text(
                        S.of(context).typeElation,
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
                        ref.read(selectedManicTypeProvider.notifier).update(
                              (_) => ManicType.activity,
                            );
                      },
                      style: buttonStyle(ManicType.activity),
                      child: Text(
                        S.of(context).typeActivity,
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
                      ref.read(selectedManicTypeProvider.notifier).update(
                            (_) => ManicType.other,
                          );
                    },
                    style: buttonStyle(ManicType.other),
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
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                popCount++;
                PageNavigator.push(
                  context,
                  ref.read(selectedManicTypeProvider) == ManicType.other
                      ? const SelfInputPage(isManic: true)
                      : const ManicTypeTablePage(),
                );
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
          ],
        ),
      ),
    );
  }
}
