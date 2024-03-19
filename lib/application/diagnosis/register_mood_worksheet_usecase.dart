import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/firebase/mood_worksheet_repository.dart';
import '../usecase_mixin.dart';

/// [RegisterMoodWorksheetUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、躁鬱状態を登録する
final registerMoodWorksheetUsecaseProvider =
    Provider.family<RegisterMoodWorksheetUsecase, String>(
  (ref, uid) => RegisterMoodWorksheetUsecase(ref, uid),
);

/// [RegisterMoodWorksheetUsecase] は、躁鬱状態を登録するプロセスをカプセル化する
class RegisterMoodWorksheetUsecase with UsecaseMixin {
  final Ref ref;
  final String uid;

  /// 指定された [Ref] を使用して [RegisterMoodWorksheetUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  RegisterMoodWorksheetUsecase(
    this.ref,
    this.uid,
  );

  /// 躁鬱状態を登録するユースケースの実行
  Future<void> execute({
    required String minus_5,
    required String minus_4,
    required String minus_3,
    required String minus_2,
    required String minus_1,
    required String plus_1,
    required String plus_2,
    required String plus_3,
    required String plus_4,
    required String plus_5,
  }) async {
    await run(
      ref,
      action: () async =>
          await ref.read(moodWorksheetRepositoryProvider(uid)).update(
                minus_5: minus_5,
                minus_4: minus_4,
                minus_3: minus_3,
                minus_2: minus_2,
                minus_1: minus_1,
                plus_1: plus_1,
                plus_2: plus_2,
                plus_3: plus_3,
                plus_4: plus_4,
                plus_5: plus_5,
              ),
    );
  }
}
