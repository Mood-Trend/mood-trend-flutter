import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_confs.freezed.dart';

/// AppConfs コレクションのドキュメント群
@freezed
class AppConfs with _$AppConfs {
  const factory AppConfs({
    /// レビューメニューを表示するかどうか
    required bool isShowReviewMenu,

    /// iOS のレビュー URL
    required String reviewUrlIos,

    /// Android のレビュー URL
    required String reviewUrlAndroid,
  }) = _AppConfs;
}
