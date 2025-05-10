import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_code.freezed.dart';

/// 招待コード
@freezed
abstract class InviteCode with _$InviteCode {
  const factory InviteCode({
    /// 招待コードのID
    required String id,

    /// 招待主のUID
    required String ownerUid,

    /// 有効期限
    required DateTime expiresAt,

    /// 使用済みかどうか
    @Default(false) bool isUsed,
  }) = _InviteCode;
}
