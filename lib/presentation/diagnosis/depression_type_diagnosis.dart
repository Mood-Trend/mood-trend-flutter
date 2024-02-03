import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression_type_table.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/table_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

enum DepressionType {
  melancholy,
  poorThinking,
  sleepDisorders,
  other,
}

final selectedDepressionTypeProvider =
    StateProvider<DepressionType>((_) => DepressionType.other);

class DepressionTypeDignosis extends ConsumerWidget {
  const DepressionTypeDignosis({super.key});

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

    return AsyncValueHandler(
        value: ref.watch(worksheetProvider),
        loading: () => const OverlayLoading(),
        builder: (worksheet) {
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
                            ref
                                .read(selectedDepressionTypeProvider.notifier)
                                .state = DepressionType.melancholy;
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
                                  .state = DepressionType.poorThinking;
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
                                  .state = DepressionType.sleepDisorders;
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
                            ref
                                .read(selectedDepressionTypeProvider.notifier)
                                .state = DepressionType.other;
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
                          DepressionTypeTable(
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
        });
  }
}
