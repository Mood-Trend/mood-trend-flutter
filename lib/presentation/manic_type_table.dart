import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/depression_type_diagnosis.dart';
import 'package:mood_trend_flutter/presentation/manic_type_diagnosis.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

abstract class ManicWorkSheet {
  late final String plus_5;
  late final String plus_4;
  late final String plus_3;
  late final String plus_2;
  late final String plus_1;
}

class IdeaType extends ManicWorkSheet {
  @override
  String get plus_5 => 'アイデアが成功すると確信し、実現に向けて実際に動く';
  @override
  String get plus_4 => '次々と湧き上がるアイデアを具現化しようと奮闘する';
  @override
  String get plus_3 => 'アイデアが湧き上がり、絶え間なく考え続ける';
  @override
  String get plus_2 => 'アイデアを簡単に思いつくことができる';
  @override
  String get plus_1 => 'アイデアを考えようと思えば可能である';
}

class ElationType extends ManicWorkSheet {
  @override
  String get plus_5 => '自分は絶対に正しく、すべてが上手くいくと確信する';
  @override
  String get plus_4 => 'どんなことでも自分は成功すると確信している';
  @override
  String get plus_3 => 'どんな状況でも上手くいく感覚が強い';
  @override
  String get plus_2 => '前向きで挑戦的な気持ちがあり、ポジティブなエネルギーを感じる';
  @override
  String get plus_1 => '普段より前向きな気分である';
}

class ActivityType extends ManicWorkSheet {
  @override
  String get plus_5 => '何日も1日中活動を続けているが、疲れを感じずに精力的に行動している';
  @override
  String get plus_4 => '1日が予定でいっぱいである';
  @override
  String get plus_3 => '積極的でエネルギッシュな気分で、予定をたくさん詰める';
  @override
  String get plus_2 => '普段よりも活発に動く気分である';
  @override
  String get plus_1 => '活動が可能である';
}

class ManicTypeTable extends ConsumerWidget {
  const ManicTypeTable({super.key, required this.manicType});
  final ManicType manicType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ManicWorkSheet worksheet = manicType == ManicType.idea
        ? IdeaType()
        : manicType == ManicType.elation
            ? ElationType()
            : ActivityType();
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
                        actionText: worksheet.plus_5,
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
                        actionText: worksheet.plus_4,
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
                        actionText: worksheet.plus_3,
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
                        actionText: worksheet.plus_2,
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
                        actionText: worksheet.plus_1,
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
              onPressed: () {
                PageNavigator.push(context, const DepressionTypeDignosis());
              },
              child: const Text(
                '次へ',
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
                child: Text(
                  actionText,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
