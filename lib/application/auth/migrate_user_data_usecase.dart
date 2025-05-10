import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/usecase_mixin.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/data_migration_service.dart';

/// [MigrateUserDataUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、データ移行プロセスを抽象化する
final migrateUserDataUsecaseProvider = Provider<MigrateUserDataUsecase>(
  MigrateUserDataUsecase.new,
);

/// [MigrateUserDataUsecase] は、ユーザーデータを移行するプロセスをカプセル化する
///
/// データ移行サービスとのやり取りを通じて、ユーザーデータを移行する
class MigrateUserDataUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [MigrateUserDataUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  const MigrateUserDataUsecase(this.ref);

  /// データ移行ユースケースの実行
  Future<bool> execute({
    required String sourceUid,
    required String targetUid,
  }) async {
    return await run(
      ref,
      action: () async =>
          await ref.read(dataMigrationServiceProvider).migrateUserData(
                sourceUid: sourceUid,
                targetUid: targetUid,
              ),
    );
  }
}
