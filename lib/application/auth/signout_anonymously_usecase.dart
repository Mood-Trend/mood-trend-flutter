import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/usecase_mixin.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';

/// [SignoutAnonymouslyUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signoutAnonymouslyUsecaseProvider = Provider<SignoutAnonymouslyUsecase>(
  SignoutAnonymouslyUsecase.new,
);

/// [SignoutAnonymouslyUsecase] は、匿名ユーザーを削除（サインアウト）するプロセスをカプセル化する
///
/// 認証システムとのやり取りを [AuthRepository] を通じて行い、
/// ユーザーを匿名からサインアウトさせる
class SignoutAnonymouslyUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [SignoutAnonymouslyUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const SignoutAnonymouslyUsecase(this.ref);

  /// 匿名サインアウトユースケースの実行
  Future<void> execute() async {
    await run(
      ref,
      action: () async =>
          await ref.read(firebaseAuthRepositoryProvider).delete(),
    );
  }
}
