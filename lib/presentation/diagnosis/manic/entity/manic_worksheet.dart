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
  static ManicWorksheet create(ManicType type) {
    switch (type) {
      case ManicType.idea:
        return IdeaTypeWorksheet();
      case ManicType.elation:
        return ElationTypeWorksheet();
      case ManicType.activity:
        return ActivityTypeWorksheet();
      case ManicType.other:
        return OtherManicTypeWorksheet();
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

  ManicWorksheet createWorksheet(ManicType type) {
    switch (type) {
      case ManicType.idea:
        return IdeaTypeWorksheet();
      case ManicType.elation:
        return ElationTypeWorksheet();
      case ManicType.activity:
        return ActivityTypeWorksheet();
      case ManicType.other:
      default:
        throw AppException('Unsupported ManicType: $type');
    }
  }
}

/// [ManicWorksheet] を具象化したアイデアのワークシート
class IdeaTypeWorksheet extends ManicWorksheet {
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

/// [ManicWorksheet] を具象化した気分高揚のワークシート
class ElationTypeWorksheet extends ManicWorksheet {
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

/// [ManicWorksheet] を具象化した活動性のワークシート
class ActivityTypeWorksheet extends ManicWorksheet {
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

/// [ManicWorksheet] を具象化したその他のワークシート
class OtherManicTypeWorksheet extends ManicWorksheet {
  @override
  String get plus_5 => '';
  @override
  String get plus_4 => '';
  @override
  String get plus_3 => '';
  @override
  String get plus_2 => '';
  @override
  String get plus_1 => '';
}
