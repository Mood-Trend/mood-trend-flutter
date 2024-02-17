// ignore_for_file: overridden_fields

import 'package:mood_trend_flutter/domain/app_exception.dart';

/// 躁のタイプを示す列挙体
enum ManicType {
  // アイデア
  idea,
  // 気分高揚
  elation,
  // 活動性
  activity,
  // その他
  other,
}

/// [ManicWorksheet] を生成するファクトリクラス
class ManicWorksheetFactory {
  static ManicWorksheet create(
    ManicType type, [
    String? plus_1,
    String? plus_2,
    String? plus_3,
    String? plus_4,
    String? plus_5,
  ]) {
    switch (type) {
      case ManicType.idea:
        return _IdeaTypeWorksheet();
      case ManicType.elation:
        return _ElationTypeWorksheet();
      case ManicType.activity:
        return _ActivityTypeWorksheet();
      case ManicType.other:
        return _OtherManicTypeWorksheet(
          plus_1: plus_1 ?? '',
          plus_2: plus_2 ?? '',
          plus_3: plus_3 ?? '',
          plus_4: plus_4 ?? '',
          plus_5: plus_5 ?? '',
        );
      default:
        throw AppException('Unsupported ManicType: $type');
    }
  }
}

/// 躁のタイプのワークシートを抽象化したクラス
abstract class ManicWorksheet {
  late final String plus_5;
  late final String plus_4;
  late final String plus_3;
  late final String plus_2;
  late final String plus_1;
}

/// [ManicWorksheet] を具象化したアイデアのワークシート
class _IdeaTypeWorksheet extends ManicWorksheet {
  @override
  final String plus_5 = 'アイデアが成功すると確信し、実現に向けて実際に動く';
  @override
  final String plus_4 = '次々と湧き上がるアイデアを具現化しようと奮闘する';
  @override
  final String plus_3 = 'アイデアが湧き上がり、絶え間なく考え続ける';
  @override
  final String plus_2 = 'アイデアを簡単に思いつくことができる';
  @override
  final String plus_1 = 'アイデアを考えようと思えば可能である';
}

/// [ManicWorksheet] を具象化した気分高揚のワークシート
class _ElationTypeWorksheet extends ManicWorksheet {
  @override
  final String plus_5 = '自分は絶対に正しく、すべてが上手くいくと確信する';
  @override
  final String plus_4 = 'どんなことでも自分は成功すると確信している';
  @override
  final String plus_3 = 'どんな状況でも上手くいく感覚が強い';
  @override
  final String plus_2 = '前向きで挑戦的な気持ちがあり、ポジティブなエネルギーを感じる';
  @override
  final String plus_1 = '普段より前向きな気分である';
}

/// [ManicWorksheet] を具象化した活動性のワークシート
class _ActivityTypeWorksheet extends ManicWorksheet {
  @override
  final String plus_5 = '何日も1日中活動を続けているが、疲れを感じずに精力的に行動している';
  @override
  final String plus_4 = '1日が予定でいっぱいである';
  @override
  final String plus_3 = '積極的でエネルギッシュな気分で、予定をたくさん詰める';
  @override
  final String plus_2 = '普段よりも活発に動く気分である';
  @override
  final String plus_1 = '活動が可能である';
}

/// [ManicWorksheet] を具象化したその他のワークシート
class _OtherManicTypeWorksheet extends ManicWorksheet {
  _OtherManicTypeWorksheet({
    required this.plus_5,
    required this.plus_4,
    required this.plus_3,
    required this.plus_2,
    required this.plus_1,
  });

  @override
  final String plus_5;
  @override
  final String plus_4;
  @override
  final String plus_3;
  @override
  final String plus_2;
  @override
  final String plus_1;
}
