import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/enum/mood_state.dart';
import '../../domain/enum/saving_type.dart';
import '../../domain/model/mood_point.dart';
import '../../domain/model/mood_worksheet.dart';
import '../../domain/model/weather_item.dart';
import '../../infrastructure/provider/repository_provider.dart';
import '../usecase/add_mood_point_usecase.dart';
import '../usecase/overlay_loading_notifier.dart';
import '../usecase/register_mood_worksheet_usecase.dart';
import '../usecase/saving_status_notifier.dart';
import '../usecase/selected_mood_condition_notifier.dart';
import '../usecase/signin_anonymously_usecase.dart';
import '../usecase/signout_anonymously_usecase.dart';
import '../usecase/url_launcher_service.dart';
import '../usecase/visible_maximum_notifier.dart';
import '../usecase/visible_minimum_notifier.dart';
import '../usecase/weather_item_notifier.dart';

/// [AddMoodPointUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final addMoodPointUsecaseProvider =
    Provider.family<AddMoodPointUsecase, String>(
  (ref, uid) => AddMoodPointUsecase(ref, uid),
);

/// [SignoutAnonymouslyUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signoutAnonymouslyUsecaseProvider = Provider<SignoutAnonymouslyUsecase>(
  SignoutAnonymouslyUsecase.new,
);

/// [SigninAnonymouslyUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、認証プロセスを抽象化する
final signinAnonymouslyUsecaseProvider = Provider<SigninAnonymouslyUsecase>(
  SigninAnonymouslyUsecase.new,
);

/// [RegisterMoodWorksheetUsecase] のインスタンスを作成するためのプロバイダ
///
/// UI 層にユースケースを注入するために使用され、躁鬱状態を登録する
final registerMoodWorksheetUsecaseProvider =
    Provider.family<RegisterMoodWorksheetUsecase, String>(
  (ref, uid) => RegisterMoodWorksheetUsecase(ref, uid),
);

final visibleMaximumNotifierProvider =
    NotifierProvider.autoDispose<VisibleMaximumNotifier, DateTime>(
  VisibleMaximumNotifier.new,
);

/// 天気 [WeatherItem] のリスト状態を提供する [NotifierProvider]。
final weatherItemNotifierProvider =
    NotifierProvider<WeatherItemNotifier, List<WeatherItem>>(() {
  return WeatherItemNotifier();
});

final visibleMinimumNotifierProvider =
    NotifierProvider.autoDispose<VisibleMinimumNotifier, DateTime>(
  VisibleMinimumNotifier.new,
);

/// [MoodWorksheet] を購読する [StreamProvider]
final subscribeMoodWorksheetProvider =
    StreamProvider.family<MoodWorksheet, String>(
  (ref, uid) => ref.watch(moodWorksheetRepositoryProvider(uid)).subscribe(),
);

/// [MoodPoint] を購読する [StreamProvider]
final subscribeMoodPointsProvider =
    StreamProvider.family<List<MoodPoint>, String>(
  (ref, uid) =>
      ref.watch(moodPointRepositoryProvider(uid)).subscribeMoodPoints(),
);

/// URL起動サービスプロバイダー
final urlLauncherServiceProvider = Provider(
  UrlLauncherService.new,
);

final isSavingProvider =
    NotifierProvider.autoDispose<SavingStatusNotifier, SavingType>(
  SavingStatusNotifier.new,
);

final selectedMoodConditionNotifierProvider =
    NotifierProvider.autoDispose<SelectedMoodConditionNotifier, MoodState>(
  SelectedMoodConditionNotifier.new,
);

/// [OverlayLoadingNotifier] を表示するかどうかを管理するプロバイダー
final overlayLoadingNotifierProvider =
    NotifierProvider.autoDispose<OverlayLoadingNotifier, bool>(
  OverlayLoadingNotifier.new,
);
