// ignore_for_file: overridden_fields

import 'package:mood_trend_flutter/presentation/l10n/generated/l10n.dart';

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
    String? minus_1,
    String? minus_2,
    String? minus_3,
    String? minus_4,
    String? minus_5,
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
          minus_1: minus_1 ?? '',
          minus_2: minus_2 ?? '',
          minus_3: minus_3 ?? '',
          minus_4: minus_4 ?? '',
          minus_5: minus_5 ?? '',
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
  final String minus_1 = S.current.melancholyMinus_1;
  @override
  final String minus_2 = S.current.melancholyMinus_2;
  @override
  final String minus_3 = S.current.melancholyMinus_3;
  @override
  final String minus_4 = S.current.melancholyMinus_4;
  @override
  final String minus_5 = S.current.melancholyMinus_5;
}

/// [DepressionWorksheet] を具象化した思考力低下のワークシート
class _PoorThinkingTypeWorksheet extends DepressionWorksheet {
  @override
  final String minus_1 = S.current.thinkMinus_1;
  @override
  final String minus_2 = S.current.thinkMinus_2;
  @override
  final String minus_3 = S.current.thinkMinus_3;
  @override
  final String minus_4 = S.current.thinkMinus_4;
  @override
  final String minus_5 = S.current.thinkMinus_5;
}

/// [DepressionWorksheet] を具象化した睡眠障害のワークシート
class _SleepDisordersTypeWorksheet extends DepressionWorksheet {
  @override
  final String minus_1 = S.current.sleepMinus_1;
  @override
  final String minus_2 = S.current.sleepMinus_2;
  @override
  final String minus_3 = S.current.sleepMinus_3;
  @override
  final String minus_4 = S.current.sleepMinus_4;
  @override
  final String minus_5 = S.current.sleepMinus_5;
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
