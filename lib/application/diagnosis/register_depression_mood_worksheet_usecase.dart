// lib/application/graph/register_depression_mood_usecase.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/firebase/mood_worksheet_repository.dart';
import '../usecase_mixin.dart';

/// [RegisterDepressionMoodWorksheetUseCase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、鬱状態を登録する
final registerDepressionMoodWorksheetUseCaseProvider =
    Provider<RegisterDepressionMoodWorksheetUseCase>(
  RegisterDepressionMoodWorksheetUseCase.new,
);

/// [RegisterDepressionMoodWorksheetUseCase] は、鬱状態を登録するプロセスをカプセル化する
class RegisterDepressionMoodWorksheetUseCase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [RegisterDepressionMoodWorksheetUseCase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  RegisterDepressionMoodWorksheetUseCase(this.ref);

  /// 鬱状態を登録するユースケースの実行
  Future<void> execute({
    required String minus_5,
    required String minus_4,
    required String minus_3,
    required String minus_2,
    required String minus_1,
  }) async {
    await run(
      ref,
      action: () async =>
          await ref.read(moodWorksheetRepositoryProvider).update(
                minus_5: minus_5,
                minus_4: minus_4,
                minus_3: minus_3,
                minus_2: minus_2,
                minus_1: minus_1,
              ),
    );
  }
}
