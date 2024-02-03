import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression_type_diagnosis.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

abstract class ManicWorkSheet {
  late final String minus_1;
  late final String minus_2;
  late final String minus_3;
  late final String minus_4;
  late final String minus_5;
}

class MelancholyType extends ManicWorkSheet {
  @override
  String get minus_1 => 'どちらかというと後ろ向きである';
  @override
  String get minus_2 => '軽度の憂鬱感があり、日常の中でやりたくないことが増えている';
  @override
  String get minus_3 => '憂鬱感が強く、生活が厳しい。普段の活動に対する興味をほとんど持てない';
  @override
  String get minus_4 => '強い憂鬱感があり、生活に支障が出ている。日常の機能に影響を与えている';
  @override
  String get minus_5 => '完全に絶望的で、生きることが苦痛でしかない。日常の動作がままならない';
}

class PoorThinkingType extends ManicWorkSheet {
  @override
  String get minus_1 => 'ものを考えるのが少し億劫に感じる時もある';
  @override
  String get minus_2 => '軽度の思考の鈍さがある';
  @override
  String get minus_3 => '思考が鈍く、問題解決や判断力が著しく低下している';
  @override
  String get minus_4 => '思考が著しく低下しており、集中や記憶に大きな問題がある';
  @override
  String get minus_5 => '思考がまったく機能しておらず、ほとんどのことが理解できない';
}

class SleepDisordersType extends ManicWorkSheet {
  @override
  String get minus_1 => '寝起きがスッキリしない';
  @override
  String get minus_2 => '睡眠の質が低く、日中の眠気や疲労感がある';
  @override
  String get minus_3 => '睡眠が乱れ、十分な休息を得られていない。日中の眠気が強い';
  @override
  String get minus_4 => '睡眠が極端に不足、または過度に寝ており、日中の機能が著しく低下している';
  @override
  String get minus_5 => '眠れずに常に過度の不眠状態で、日中も強い疲労感がある。または日中のほとんどを寝て過ごしている';
}

class DepressionTypeTable extends ConsumerWidget {
  const DepressionTypeTable({super.key, required this.depressionType});
  final DepressionType depressionType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ManicWorkSheet worksheet = depressionType == DepressionType.melancholy
        ? MelancholyType()
        : depressionType == DepressionType.poorThinking
            ? PoorThinkingType()
            : SleepDisordersType();

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
            const Text(
              '提案',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.green.withOpacity(0.4),
                    ),
                    child: Column(children: [
                      TableCell(
                        moodValue: '+5',
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
                        moodValue: '+4',
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
                        moodValue: '+3',
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
                        moodValue: '+2',
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
                        moodValue: '+1',
                        actionText: worksheet.minus_5,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
                fixedSize: const Size(330, 60),
              ),
              onPressed: () {},
              child: const Text(
                '完了',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            )
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
            height: 80,
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
