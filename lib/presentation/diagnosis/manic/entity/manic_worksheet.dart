// ignore_for_file: overridden_fields

import 'package:mood_trend_flutter/generated/l10n.dart';

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
  final String plus_5 = S.current.ideaPlus_5;
  @override
  final String plus_4 = S.current.ideaPlus_4;
  @override
  final String plus_3 = S.current.ideaPlus_3;
  @override
  final String plus_2 = S.current.ideaPlus_2;
  @override
  final String plus_1 = S.current.ideaPlus_1;
}

/// [ManicWorksheet] を具象化した気分高揚のワークシート
class _ElationTypeWorksheet extends ManicWorksheet {
  @override
  final String plus_5 = S.current.elationPlus_5;
  @override
  final String plus_4 = S.current.elationPlus_4;
  @override
  final String plus_3 = S.current.elationPlus_3;
  @override
  final String plus_2 = S.current.elationPlus_2;
  @override
  final String plus_1 = S.current.elationPlus_1;
}

/// [ManicWorksheet] を具象化した活動性のワークシート
class _ActivityTypeWorksheet extends ManicWorksheet {
  @override
  final String plus_5 = S.current.activityPlus_5;
  @override
  final String plus_4 = S.current.activityPlus_4;
  @override
  final String plus_3 = S.current.activityPlus_3;
  @override
  final String plus_2 = S.current.activityPlus_2;
  @override
  final String plus_1 = S.current.activityPlus_1;
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
