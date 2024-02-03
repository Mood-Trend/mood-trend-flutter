import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/firebase/mood_point_repository.dart';
import '../usecase_mixin.dart';

/// [AddMoodPointUseCase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final addMoodPointUseCaseProvider = Provider<AddMoodPointUseCase>(
  AddMoodPointUseCase.new,
);

/// [AddMoodPointUseCase] は、匿名でサインインするプロセスをカプセル化する
///
/// 気分値追加を [MoodPointRepository] を通じて行う
/// さらに、ローディング管理を [UsecaseMixin] にて隠蔽している
class AddMoodPointUseCase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [AddMoodPointUseCase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  AddMoodPointUseCase(this.ref);

  /// 気分値、予定数の登録
  Future<void> execute({
    required int point,
    required int plannedVolume,
    required DateTime moodDate,
  }) async {
    await run(
      ref,
      action: () async => await ref.read(moodPointRepositoryProvider).add(
            point: point,
            plannedVolume: plannedVolume,
            moodDate: moodDate,
          ),
    );
  }
}
