import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/app_confs.dart';
import '../../domain/model/app_info.dart';
import '../../domain/model/app_conf_document.dart';
import '../../domain/model/conf_document.dart';
import '../repository/analytics_repository.dart';
import '../repository/app_confs_repository.dart';
import '../repository/conf_repository.dart';
import '../repository/mood_point_repository.dart';
import '../repository/mood_worksheet_repository.dart';
import '../repository/user_repository.dart';

/// FirebaseAnalyticsObserverのインスタンス
final analyticsObserverRepository = Provider((ref) =>
    FirebaseAnalyticsObserver(analytics: ref.watch(analyticsRepository)));

/// [AppConfsRepository] のインスタンスを提供する [Provider]
final appConfsRepositoryProvider = Provider.autoDispose<AppConfsRepository>(
  (ref) => AppConfsRepository(
    appConfsCollectionRef: ref.watch(appConfsCollectionRefProvider),
  ),
);

/// アプリ設定コレクションの参照結果を提供する [Provider].
final appConfsCollectionRefProvider = Provider.autoDispose(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('app_confs')
      .withConverter<AppConfDocument>(
        fromFirestore: (snapshot, _) => AppConfDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (conf, options) => conf.toJson(),
      ),
);

/// [FirebaseAuth] のインスタンスを提供する [Provider].
final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

/// [FirebaseAuth] の [User] を返す [StreamProvider].
/// ユーザーの認証状態が変更される（ログイン、ログアウトする）たびに更新される。
final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

/// 現在のユーザー ID を提供する [Provider].
final userIdProvider = Provider<String?>((ref) {
  ref.watch(authUserProvider);
  return ref.watch(firebaseAuthProvider).currentUser?.uid;
});

/// ユーザーがログインしているかどうかを示す bool 値を提供する Provider.
/// [userIdProvider] の変更を watch しているので、ユーザーの認証状態が変更される
/// たびに、この [Provider] も更新される。
final isSignedInProvider = Provider<bool>(
  (ref) => ref.watch(userIdProvider) != null,
);

/// [ConfRepository] のインスタンスを提供する [Provider]
final confRepositoryProvider = Provider.family<ConfRepository, String>(
  (ref, uid) => ConfRepository(
    confCollectionRef: ref.read(confCollectionRefProvider(uid)),
  ),
);

/// Conf コレクションの参照結果を提供する [Provider].
final confCollectionRefProvider =
    Provider.family<CollectionReference<ConfDocument>, String>(
  (ref, uid) => ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(uid)
      .collection('conf')
      .withConverter<ConfDocument>(
        fromFirestore: (snapshot, _) => ConfDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (confDoc, options) => confDoc.toJson(),
      ),
);

/// [FirebaseFirestore] のインスタンスを提供する [Provider].
final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (_) => FirebaseFirestore.instance,
);

/// [MoodPointRepository] のインスタンスを提供する [Provider]
final moodPointRepositoryProvider =
    Provider.family<MoodPointRepository, String>(
  (ref, uid) => MoodPointRepository(
    moodPointsCollectionRef: ref.watch(moodPointsCollectionRefProvider(uid)),
  ),
);

/// MoodPoints コレクションの参照結果を提供する [Provider].
final moodPointsCollectionRefProvider =
    Provider.family<CollectionReference<MoodPointDocument>, String>(
  (ref, uid) => ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(uid)
      .collection('mood_points')
      .withConverter<MoodPointDocument>(
        fromFirestore: (snapshot, _) => MoodPointDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (confDoc, options) => confDoc.toJson(),
      ),
);

/// [MoodWorksheetRepository] のインスタンスを提供する [Provider]
final moodWorksheetRepositoryProvider =
    Provider.family<MoodWorksheetRepository, String>(
  (ref, uid) => MoodWorksheetRepository(
    moodWorksheetCollectionRef:
        ref.read(moodWorksheetCollectionRefProvider(uid)),
  ),
);

/// MoodWorksheet コレクションの参照結果を提供する [Provider].
final moodWorksheetCollectionRefProvider =
    Provider.family<CollectionReference<MoodWorksheetDocument>, String>(
  (ref, uid) => ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(uid)
      .collection('mood_worksheet')
      .withConverter<MoodWorksheetDocument>(
        fromFirestore: (snapshot, _) => MoodWorksheetDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (worksheetDoc, options) => worksheetDoc.toJson(),
      ),
);

/// [UserRepository] のインスタンスを提供する [Provider]
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(
    userCollectionRef: ref.watch(userCollectionRefProvider),
  ),
);

/// ユーザーコレクションの参照結果を提供する [Provider].
final userCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .withConverter<UserDocument>(
        fromFirestore: (snapshot, _) => UserDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (postDoc, options) => postDoc.toJson(),
      ),
);

/// アプリ情報プロバイダー
final appInfoProvider = Provider<AppInfo>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

final waitUntilUserCreatedFutureProvider = FutureProvider.family<void, String>(
  (ref, uid) {
    ref.read(userRepositoryProvider).waitUntilUserCreated(uid);
  },
);

/// [AppConfs] を提供する [Provider]
final appConfsProvider = StreamProvider.autoDispose<AppConfs>(
  (ref) => ref.watch(appConfsRepositoryProvider).subScribeAppConfs(),
);
