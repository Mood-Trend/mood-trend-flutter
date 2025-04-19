import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/usecase_mixin.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';

/// [LinkAnonymousWithGoogleUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final linkAnonymousWithGoogleUsecaseProvider = Provider<LinkAnonymousWithGoogleUsecase>(
  LinkAnonymousWithGoogleUsecase.new,
);

/// [LinkAnonymousWithGoogleUsecase] は、匿名アカウントをGoogleアカウントにリンクするプロセスをカプセル化する
///
/// 認証システムとのやり取りを [AuthRepository] を通じて行い、
/// 匿名アカウントをGoogleアカウントにリンクさせる
class LinkAnonymousWithGoogleUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [LinkAnonymousWithGoogleUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const LinkAnonymousWithGoogleUsecase(this.ref);

  /// 匿名アカウントとGoogleアカウントをリンクするユースケースの実行
  Future<String> execute() async {
    return await run(
      ref,
      action: () async => await ref.read(firebaseAuthRepositoryProvider).linkAnonymousWithGoogle(),
    );
  }
}
