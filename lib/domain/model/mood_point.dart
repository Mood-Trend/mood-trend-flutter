import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/weather.dart';

part 'mood_point.freezed.dart';

/// MoodPoint コレクションのドキュメント
@freezed
abstract class MoodPoint with _$MoodPoint {
  const factory MoodPoint({
    /// 気分値 ID
    required String pointId,

    /// 気分値
    required int point,

    /// 予定量
    required int plannedVolume,

    // 睡眠時間
    required double? sleepHours,

    // 歩数
    required int? stepCount,

    // 天気
    required List<Weather> weather,

    // メモ
    required String? memo,

    /// 気分日
    required DateTime moodDate,
  }) = _MoodPoint;
}
