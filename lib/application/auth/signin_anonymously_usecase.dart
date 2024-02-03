import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/usecase_mixin.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';

/// [SigninAnonymouslyUseCase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signinAnonymouslyUseCaseProvider = Provider<SigninAnonymouslyUseCase>(
  SigninAnonymouslyUseCase.new,
);

/// [SigninAnonymouslyUseCase] は、匿名でサインインするプロセスをカプセル化する
///
/// 認証システムとのやり取りを [AuthRepository] を通じて行い、
/// ユーザーを匿名でサインインさせる
class SigninAnonymouslyUseCase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [SigninAnonymouslyUseCase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const SigninAnonymouslyUseCase(this.ref);

  /// 匿名サインインユースケースの実行
  Future<void> execute() async {
    await run(
      ref,
      () async =>
          await ref.read(firebaseAuthRepositoryProvider).signinAnonymously(),
    );
  }
}
