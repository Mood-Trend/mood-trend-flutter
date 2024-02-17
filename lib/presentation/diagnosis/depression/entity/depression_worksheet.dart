// ignore_for_file: overridden_fields

import '../../../../domain/app_exception.dart';

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

/// [DepressionWorksheet] を生成するファクトリクラス
class DepressionWorksheetFactory {
  /// [DepressionType] に応じた [DepressionWorksheet] を生成する
  static DepressionWorksheet create(
    DepressionType type, [
    String minus_1 = '',
    String minus_2 = '',
    String minus_3 = '',
    String minus_4 = '',
    String minus_5 = '',
  ]) {
    switch (type) {
      case DepressionType.melancholy:
        return _MelancholyTypeWorksheet();
      case DepressionType.poorThinking:
        return _PoorThinkingTypeWorksheet();
      case DepressionType.sleepDisorders:
        return _SleepDisordersTypeWorksheet();
      case DepressionType.other:
        return _OtherDepressionTypeWorksheet(
          minus_1: minus_1,
          minus_2: minus_2,
          minus_3: minus_3,
          minus_4: minus_4,
          minus_5: minus_5,
        );
      default:
        throw AppException('Unsupported ManicType: $type');
    }
  }
}

/// 鬱のタイプのワークシートを抽象化したクラス
abstract class DepressionWorksheet {
  late final String minus_1;
  late final String minus_2;
  late final String minus_3;
  late final String minus_4;
  late final String minus_5;
}

/// [DepressionWorksheet] を具象化した憂鬱のワークシート
class _MelancholyTypeWorksheet extends DepressionWorksheet {
  @override
  final String minus_1 = 'どちらかというと後ろ向きである';
  @override
  final String minus_2 = '軽度の憂鬱感があり、日常の中でやりたくないことが増えている';
  @override
  final String minus_3 = '憂鬱感が強く、生活が厳しい。普段の活動に対する興味をほとんど持てない';
  @override
  final String minus_4 = '強い憂鬱感があり、生活に支障が出ている。日常の機能に影響を与えている';
  @override
  final String minus_5 = '完全に絶望的で、生きることが苦痛でしかない。日常の動作がままならない';
}

/// [DepressionWorksheet] を具象化した思考力低下のワークシート
class _PoorThinkingTypeWorksheet extends DepressionWorksheet {
  @override
  final String minus_1 = 'ものを考えるのが少し億劫に感じる時もある';
  @override
  final String minus_2 = '軽度の思考の鈍さがある';
  @override
  final String minus_3 = '思考が鈍く、問題解決や判断力が著しく低下している';
  @override
  final String minus_4 = '思考が著しく低下しており、集中や記憶に大きな問題がある';
  @override
  final String minus_5 = '思考がまったく機能しておらず、ほとんどのことが理解できない';
}

/// [DepressionWorksheet] を具象化した睡眠障害のワークシート
class _SleepDisordersTypeWorksheet extends DepressionWorksheet {
  @override
  final String minus_1 = '寝起きがスッキリしない';
  @override
  final String minus_2 = '睡眠の質が低く、日中の眠気や疲労感がある';
  @override
  final String minus_3 = '睡眠が乱れ、十分な休息を得られていない。日中の眠気が強い';
  @override
  final String minus_4 = '睡眠が極端に不足、または過度に寝ており、日中の機能が著しく低下している';
  @override
  final String minus_5 = '眠れずに常に過度の不眠状態で、日中も強い疲労感がある。または日中のほとんどを寝て過ごしている';
}

/// [DepressionWorksheet] を具象化したその他のワークシート
class _OtherDepressionTypeWorksheet extends DepressionWorksheet {
  _OtherDepressionTypeWorksheet({
    required this.minus_1,
    required this.minus_2,
    required this.minus_3,
    required this.minus_4,
    required this.minus_5,
  });

  @override
  final String minus_1;
  @override
  final String minus_2;
  @override
  final String minus_3;
  @override
  final String minus_4;
  @override
  final String minus_5;
}
