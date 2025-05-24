import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/depression_type_diagnosis_page.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/self_input_depression_notifier.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic/self_input_manic_notifier.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/register_diagnosis_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/navigation_utils.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../common/error_handler_mixin.dart';

/// 躁・鬱の状態入力で「独自に入力」を選択した場合の画面
class SelfInputPage extends ConsumerWidget with ErrorHandlerMixin {
  SelfInputPage({
    super.key,
    required this.isManic,
    required this.uid,
  });

  /// 躁の場合は `true`
  /// 鬱の場合は `false`
  final bool isManic;

  final String uid;

  final TextEditingController plus1TextController = TextEditingController();
  final TextEditingController plus2TextController = TextEditingController();
  final TextEditingController plus3TextController = TextEditingController();
  final TextEditingController plus4TextController = TextEditingController();
  final TextEditingController plus5TextController = TextEditingController();
  final TextEditingController minus1TextController = TextEditingController();
  final TextEditingController minus2TextController = TextEditingController();
  final TextEditingController minus3TextController = TextEditingController();
  final TextEditingController minus4TextController = TextEditingController();
  final TextEditingController minus5TextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isManic
            ? CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Text(
                          S.of(context).inputManic,
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              '+5',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: plus5TextController,
                          decoration: InputDecoration(
                            labelText: S.of(context).inputRequest,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGrey,
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Text(
                              '+4',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: plus4TextController,
                          decoration: InputDecoration(
                            labelText: S.of(context).inputRequest,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGrey,
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Text(
                              '+3',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: plus3TextController,
                          decoration: InputDecoration(
                            labelText: S.of(context).inputRequest,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGrey,
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Text(
                              '+2',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: plus2TextController,
                          decoration: InputDecoration(
                            labelText: S.of(context).inputRequest,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGrey,
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Text(
                              '+1',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: plus1TextController,
                          decoration: InputDecoration(
                            labelText: S.of(context).inputRequest,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGrey,
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  ref
                                      .read(selfInputManicNotifierProvider
                                          .notifier)
                                      .update(
                                        plus1: plus1TextController.text,
                                        plus2: plus2TextController.text,
                                        plus3: plus3TextController.text,
                                        plus4: plus4TextController.text,
                                        plus5: plus5TextController.text,
                                      );
                                  popCount++;
                                  PageNavigator.push(
                                    context,
                                    DepressionTypeDiagnosisPage(uid: uid),
                                  ).then((value) => popCount--);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green,
                                  foregroundColor: AppColors.white,
                                  fixedSize: const Size(350, 60),
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
                      ],
                    ),
                  ),
                ],
              )
            : CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).inputDepression,
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  '-1',
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: minus1TextController,
                              decoration: InputDecoration(
                                labelText: S.of(context).inputRequest,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.lightGrey,
                                    width: 5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              children: [
                                Text(
                                  '-2',
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: minus2TextController,
                              decoration: InputDecoration(
                                labelText: S.of(context).inputRequest,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.lightGrey,
                                    width: 5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              children: [
                                Text(
                                  '-3',
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: minus3TextController,
                              decoration: InputDecoration(
                                labelText: S.of(context).inputRequest,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.lightGrey,
                                    width: 5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              children: [
                                Text(
                                  '-4',
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: minus4TextController,
                              decoration: InputDecoration(
                                labelText: S.of(context).inputRequest,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.lightGrey,
                                    width: 5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              children: [
                                Text(
                                  '-5',
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: minus5TextController,
                              decoration: InputDecoration(
                                labelText: S.of(context).inputRequest,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.lightGrey,
                                    width: 5,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                ref
                                    .read(selfInputDepressionNotifierProvider
                                        .notifier)
                                    .update(
                                      minus1: minus1TextController.text,
                                      minus2: minus2TextController.text,
                                      minus3: minus3TextController.text,
                                      minus4: minus4TextController.text,
                                      minus5: minus5TextController.text,
                                    );
                                popCount++;
                                PageNavigator.push(context,
                                        RegisterDiagnosisPage(uid: uid))
                                    .then((value) => popCount--);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.green,
                                foregroundColor: AppColors.white,
                                fixedSize: const Size(350, 60),
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
                ],
              ),
      ),
    );
  }
}
