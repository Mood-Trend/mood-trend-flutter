import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/usecase_mixin.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';

/// [SigninWithGoogleUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signinWithGoogleUsecaseProvider = Provider<SigninWithGoogleUsecase>(
  SigninWithGoogleUsecase.new,
);

/// [SigninWithGoogleUsecase] は、Googleアカウントでサインインするプロセスをカプセル化する
///
/// 認証システムとのやり取りを [AuthRepository] を通じて行い、
/// ユーザーをGoogleアカウントでサインインさせる
class SigninWithGoogleUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [SigninWithGoogleUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const SigninWithGoogleUsecase(this.ref);

  /// Googleサインインユースケースの実行
  Future<String> execute() async {
    return await run(
      ref,
      action: () async => await ref.read(firebaseAuthRepositoryProvider).signInWithGoogle(),
    );
  }
}
