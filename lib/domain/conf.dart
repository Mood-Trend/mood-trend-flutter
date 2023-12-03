import 'package:freezed_annotation/freezed_annotation.dart';

part 'conf.freezed.dart';

/// ユーザー Conf
@freezed
class Conf with _$Conf {
  const factory Conf({
    /// Conf ID
    required String confId,

    /// ユーザーが入力できる最大の予定数
    required int maxPlannedVolume,

    /// オンボーディング完了済みかどうか
    required bool isOnboardingCompleted,
  }) = _Conf;
}
