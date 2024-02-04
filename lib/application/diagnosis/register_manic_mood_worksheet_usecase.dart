// lib/application/graph/register_manic_mood_usecase.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/mood_worksheet_repository.dart';
import '../usecase_mixin.dart';

/// [RegisterManicMoodWorksheetUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、躁状態を登録する
final registerManicMoodWorksheetUsecaseProvider =
    Provider<RegisterManicMoodWorksheetUsecase>(
  (ref) => RegisterManicMoodWorksheetUsecase(ref),
);

/// [RegisterManicMoodWorksheetUsecase] は、躁状態を登録するプロセスをカプセル化する
class RegisterManicMoodWorksheetUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [RegisterManicMoodWorksheetUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  RegisterManicMoodWorksheetUsecase(this.ref);

  /// 躁状態を登録するユースケースの実行
  Future<void> execute({
    required String plus_1,
    required String plus_2,
    required String plus_3,
    required String plus_4,
    required String plus_5,
  }) async {
    await run(
      ref,
      action: () async =>
          await ref.read(moodWorksheetRepositoryProvider).update(
                plus_1: plus_1,
                plus_2: plus_2,
                plus_3: plus_3,
                plus_4: plus_4,
                plus_5: plus_5,
              ),
    );
  }
}
