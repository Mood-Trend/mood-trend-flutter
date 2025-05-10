import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

/// ユーザー
@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    /// Auth の uid
    required String uid,

    /// 表示名
    required String displayName,

    /// プロフィール画像の URL
    required String imageUrl,

    /// 支援者のUIDリスト
    @Default([]) List<String> supporterIds,
  }) = _AppUser;
}
