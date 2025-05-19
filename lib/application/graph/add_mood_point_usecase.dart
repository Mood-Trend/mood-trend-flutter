import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/firebase/mood_point_repository.dart';
import '../usecase_mixin.dart';

import '../../presentation/graph/input_modal.dart';

/// [AddMoodPointUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final addMoodPointUsecaseProvider =
    Provider.family<AddMoodPointUsecase, String>(
  (ref, uid) => AddMoodPointUsecase(ref, uid),
);

/// [AddMoodPointUsecase] は、匿名でサインインするプロセスをカプセル化する
///
/// 気分値追加を [MoodPointRepository] を通じて行う
/// さらに、ローディング管理を [UsecaseMixin] にて隠蔽している
class AddMoodPointUsecase with UsecaseMixin {
  final Ref ref;
  final String uid;

  /// 指定された [Ref] を使用して [AddMoodPointUsecase] を構築する
  ///
  /// [Ref] は必要なプロバイダーを読み取るために使用される
  AddMoodPointUsecase(this.ref, this.uid);

  /// 気分値、予定数の登録
  /// 返却値：登録成功時は true、登録失敗時（同じ日付で既に登録されている場合）は false
  Future<bool> execute({
    /// 気分値
    required int point,

    /// 予定数
    required int plannedVolume,

    // 睡眠時間
    required double sleepHours,

    // 歩数
    required int stepCount,

    // 天気
    required List<Weather> weather, 
    //required String weather, 

    // メモ
    required String memo,

    /// 気分値の日付
    required DateTime moodDate,
  }) async {
    return run(
      ref,
      action: () async {
        // 同じ日付の気分値が既に登録されていないか確認
        final isExist =
            await ref.read(moodPointRepositoryProvider(uid)).isExist(
                  moodDate: moodDate,
                );
        if (isExist) return false;

        // [MoodPointRepository] を使用して気分値を追加
        await ref.read(moodPointRepositoryProvider(uid)).add(
              point: point,
              plannedVolume: plannedVolume,
              sleepHours: sleepHours,
              stepCount: stepCount,
              weather: weather,
              memo: memo,
              moodDate: moodDate,
            );
        return true;
      },
      isOverlayLoading: false,
    );
  }

  /// 気分値、予定数の登録（確認ダイアログ後の登録）
  Future<void> executeForUpdate({
    /// 気分値
    required int point,

    /// 予定数
    required int plannedVolume,

    // 睡眠時間
    required double sleepHours,

    // 歩数
    required int stepCount,

    // 天気
    required List<Weather> weather, 
    //required List<String> weather, 
    //required String weather, 

    // メモ
    required String memo,

    /// 気分値の日付
    required DateTime moodDate,
  }) async {
    await run(
      ref,
      action: () async {
        final oldMoodPoint =
            await ref.read(moodPointRepositoryProvider(uid)).getByDate(
                  moodDate: moodDate,
                );
        await ref.read(moodPointRepositoryProvider(uid)).update(
              pointId: oldMoodPoint.pointId,
              point: point,
              plannedVolume: plannedVolume,
              sleepHours: sleepHours,
              stepCount: stepCount,
              weather: weather,
              memo: memo,
              moodDate: moodDate,
            );
      },
      isOverlayLoading: false,
    );
  }
}
