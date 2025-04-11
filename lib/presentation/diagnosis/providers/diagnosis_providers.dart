import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/depression/entity/depression_worksheet.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic/entity/manic_worksheet.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/table_page.dart';

/// 選択された気分値目安表の状態を保持する [StateProvider]
/// 複数の画面で共有される状態
final selectedMoodStateProvider = StateProvider<MoodState>(
  (_) => MoodState.manic,
);

/// 選択された鬱のタイプを提供する [StateProvider]
final selectedDepressionTypeProvider =
    StateProvider.autoDispose<DepressionType>(
  (_) => DepressionType.other,
);

/// 選択された躁のタイプを提供する [StateProvider]
final selectedManicTypeProvider = StateProvider.autoDispose<ManicType>(
  (_) => ManicType.other,
);
