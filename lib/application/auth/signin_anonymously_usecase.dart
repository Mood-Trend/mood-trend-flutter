import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecase_mixin.dart';
import '../../infrastructure/firebase/auth_repository.dart';

/// [SigninAnonymouslyUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signinAnonymouslyUsecaseProvider = Provider<SigninAnonymouslyUsecase>(
  SigninAnonymouslyUsecase.new,
);

/// [SigninAnonymouslyUsecase] は、匿名でサインインするプロセスをカプセル化する
///
/// 認証システムとのやり取りを [AuthRepository] を通じて行い、
/// ユーザーを匿名でサインインさせる
class SigninAnonymouslyUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [SigninAnonymouslyUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const SigninAnonymouslyUsecase(this.ref);

  /// 匿名サインインユースケースの実行
  Future<void> execute() async {
    await run(
      ref,
      action: () async {
        await ref.read(firebaseAuthRepositoryProvider).signinAnonymously();
      },
    );
  }
}
