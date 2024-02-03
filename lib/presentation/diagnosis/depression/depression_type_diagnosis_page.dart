import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import 'depression_type_table_page.dart';

/// 鬱のタイプを示す列挙体
enum DepressionType {
  // 憂鬱
  melancholy,
  // 思考力低下
  poorThinking,
  // 睡眠障害
  sleepDisorders,
  // その他
  other,
}

/// 選択された鬱のタイプを提供する [StateProvider]
final selectedDepressionTypeProvider = StateProvider<DepressionType>(
  (_) => DepressionType.other,
);

/// 鬱のタイプの診断画面
class DepressionTypeDignosisPage extends ConsumerWidget {
  const DepressionTypeDignosisPage({super.key});

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
        fixedSize: const Size(130, 130),
        foregroundColor: AppColors.black,
        splashFactory: NoSplash.splashFactory,
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'あなたの鬱のタイプは？',
              style: TextStyle(
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
                    child: const Text(
                      '憂鬱',
                      style: TextStyle(
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
                      child: const Text(
                        '思考力\n低下',
                        style: TextStyle(
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
                      child: const Text(
                        '睡眠障害',
                        style: TextStyle(
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
                    child: const Text(
                      '独自に\n入力',
                      style: TextStyle(
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
                PageNavigator.push(
                    context,
                    DepressionTypeTablePage(
                      depressionType: selectedDepressionType,
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
                fixedSize: const Size(300, 60),
              ),
              child: const Text(
                '同意して次へ',
                style: TextStyle(
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
