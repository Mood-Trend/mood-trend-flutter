import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/firebase/mood_point_repository.dart';
import '../usecase_mixin.dart';

/// [AddMoodPointUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final addMoodPointUsecaseProvider = Provider<AddMoodPointUsecase>(
  AddMoodPointUsecase.new,
);

/// [AddMoodPointUsecase] は、匿名でサインインするプロセスをカプセル化する
///
/// 気分値追加を [MoodPointRepository] を通じて行う
/// さらに、ローディング管理を [UsecaseMixin] にて隠蔽している
class AddMoodPointUsecase with UsecaseMixin {
  final Ref ref;

  /// 指定された [Ref] を使用して [AddMoodPointUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  AddMoodPointUsecase(this.ref);

  /// 気分値、予定数の登録
  /// 返却値：登録成功時は true、登録失敗時（同じ日付で既に登録されている場合）は false
  Future<bool> execute({
    /// 気分値
    required int point,

    /// 予定数
    required int plannedVolume,

    /// 気分値の日付
    required DateTime moodDate,
  }) async {
    return run(ref, action: () async {
      // 同じ日付の気分値が既に登録されていないか確認
      final isExist = await ref.read(moodPointRepositoryProvider).isExist(
            moodDate: moodDate,
          );
      if (isExist) return false;

      // [MoodPointRepository] を使用して気分値を追加
      await ref.read(moodPointRepositoryProvider).add(
            point: point,
            plannedVolume: plannedVolume,
            moodDate: moodDate,
          );
      return true;
    });
  }

  /// 気分値、予定数の登録（確認ダイアログ後の登録）
  Future<void> executeForUpdate({
    /// 気分値
    required int point,

    /// 予定数
    required int plannedVolume,

    /// 気分値の日付
    required DateTime moodDate,
  }) async {
    await run(ref, action: () async {
      final oldMoodPoint =
          await ref.read(moodPointRepositoryProvider).getByDate(
                moodDate: moodDate,
              );
      await ref.read(moodPointRepositoryProvider).update(
            pointId: oldMoodPoint.pointId,
            point: point,
            plannedVolume: plannedVolume,
            moodDate: moodDate,
          );
    });
  }
}
