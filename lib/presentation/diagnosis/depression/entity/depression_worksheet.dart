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
  static DepressionWorksheet create(DepressionType type) {
    switch (type) {
      case DepressionType.melancholy:
        return MelancholyTypeWorksheet();
      case DepressionType.poorThinking:
        return PoorThinkingTypeWorksheet();
      case DepressionType.sleepDisorders:
        return SleepDisordersTypeWorksheet();
      case DepressionType.other:
      default:
        throw AppException('Unsupported ManicType: $type');
    }
  }
}

/// 鬱のタイプのワークシートを抽象化したクラス
abstract class DepressionWorksheet {
  String get minus_1;
  String get minus_2;
  String get minus_3;
  String get minus_4;
  String get minus_5;
}

/// [ManicWorksheet] を具象化した憂鬱のワークシート
class MelancholyTypeWorksheet extends DepressionWorksheet {
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

/// [ManicWorksheet] を具象化した思考力低下のワークシート
class PoorThinkingTypeWorksheet extends DepressionWorksheet {
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

/// [ManicWorksheet] を具象化した睡眠障害のワークシート
class SleepDisordersTypeWorksheet extends DepressionWorksheet {
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
