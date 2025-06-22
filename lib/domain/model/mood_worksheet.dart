import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_worksheet.freezed.dart';

/// 気分値目安表
@freezed
abstract class MoodWorksheet with _$MoodWorksheet {
  const factory MoodWorksheet({
    /// ワークシート ID
    required String worksheetId,

    /// -5
    required String minus_5,

    /// -4
    required String minus_4,

    /// -3
    required String minus_3,

    /// -2
    required String minus_2,

    /// -1
    required String minus_1,

    /// +1
    required String plus_1,

    /// +2
    required String plus_2,

    /// +3
    required String plus_3,

    /// +4
    required String plus_4,

    /// +5
    required String plus_5,
  }) = _MoodWorksheet;
}
