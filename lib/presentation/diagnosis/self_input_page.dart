import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/diagnosis/register_depression_mood_worksheet_usecase.dart';
import 'package:mood_trend_flutter/application/diagnosis/register_manic_mood_worksheet_usecase.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/depression_type_diagnosis_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../common/mixin/error_handler_mixin.dart';

class SelfInputPage extends ConsumerWidget with ErrorHandlerMixin {
  const SelfInputPage({
    super.key,
    required this.isManic,
  });
  final bool isManic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: isManic
              ? [
                  const Text(
                    '躁の症状を入力',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                            await run(ref, action: () async {
                              await ref
                                  .read(
                                      registerManicMoodWorksheetUseCaseProvider)
                                  .execute(
                                    plus_1: plus1TextController.text,
                                    plus_2: plus2TextController.text,
                                    plus_3: plus3TextController.text,
                                    plus_4: plus4TextController.text,
                                    plus_5: plus5TextController.text,
                                  );
                              // ignore: use_build_context_synchronously
                              PageNavigator.push(
                                context,
                                const DepressionTypeDignosisPage(),
                              );
                            }, successMessage: '');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: AppColors.white,
                            fixedSize: const Size(350, 60),
                          ),
                          child: const Text(
                            '決定して次へ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              : [
                  const Text(
                    '鬱の症状を入力',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                      labelText: '症状を入力してください',
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
                            await run(ref, action: () async {
                              await ref
                                  .read(
                                      registerDepressionMoodWorksheetUseCaseProvider)
                                  .execute(
                                    minus_1: minus1TextController.text,
                                    minus_2: minus2TextController.text,
                                    minus_3: minus3TextController.text,
                                    minus_4: minus4TextController.text,
                                    minus_5: minus5TextController.text,
                                  );
                              // ignore: use_build_context_synchronously
                              PageNavigator.popUntilRoot(context);
                            }, successMessage: '');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            foregroundColor: AppColors.white,
                            fixedSize: const Size(350, 60),
                          ),
                          child: const Text(
                            '決定して次へ',
                            style: TextStyle(
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
    );
  }
}
