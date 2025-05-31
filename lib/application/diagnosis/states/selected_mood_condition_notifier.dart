import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/mood_state.dart';

/// 現在の気分状態を管理する [Notifier]
///
/// - 初期状態は [MoodState.manic]
/// - [select] で状態を更新
/// - [reset] で初期状態に戻す
class SelectedMoodConditionNotifier extends AutoDisposeNotifier<MoodState> {
  @override
  MoodState build() => MoodState.manic;

  void select(MoodState state) => this.state = state;
  void reset() => state = MoodState.manic;
}

final selectedMoodConditionNotifierProvider =
    NotifierProvider.autoDispose<SelectedMoodConditionNotifier, MoodState>(
  SelectedMoodConditionNotifier.new,
);
