import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/usecase_mixin.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';

/// [SignoutAnonymouslyUseCase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signoutAnonymouslyUseCaseProvider = Provider<SignoutAnonymouslyUseCase>(
  SignoutAnonymouslyUseCase.new,
);

/// [SignoutAnonymouslyUseCase] は、匿名ユーザーを削除（サインアウト）するプロセスをカプセル化する
///
/// 認証システムとのやり取りを [AuthRepository] を通じて行い、
/// ユーザーを匿名からサインアウトさせる
class SignoutAnonymouslyUseCase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [SignoutAnonymouslyUseCase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const SignoutAnonymouslyUseCase(this.ref);

  /// 匿名サインアウトユースケースの実行
  Future<void> signout() async {
    await run(
      ref,
      () async => await ref.read(firebaseAuthRepositoryProvider).delete(),
    );
  }
}
