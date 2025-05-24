import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/app_exception.dart';
import '../../domain/mood_point.dart';
import '../../domain/weather.dart';
import 'firebase_provider.dart';

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

/// MoodPoints コレクションのドキュメントを操作する Repository
class MoodPointRepository {
  MoodPointRepository({
    required this.moodPointsCollectionRef,
  });

  final CollectionReference<MoodPointDocument> moodPointsCollectionRef;

  /// MoodPoint ドキュメントを追加する。
  Future<void> add({
    required int point,
    required int plannedVolume,
    required double sleepHours,
    required int stepCount,
    required List<Weather> weather,
    required String memo,
    required DateTime moodDate,
  }) {
    try {
      return moodPointsCollectionRef.add(
        MoodPointDocument(
          pointId: '',
          point: point,
          plannedVolume: plannedVolume,
          sleepHours: sleepHours,
          stepCount: stepCount,
          weather: weather,
          memo: memo,
          moodDate: moodDate,
        ),
      );
    } on FirebaseException catch (e) {
      throw AppException('Firestore の追加処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodPoint ドキュメントを更新する。
  Future<void> update({
    required String pointId,
    required int point,
    required int plannedVolume,
    required double sleepHours,
    required List<Weather> weather,
    required String memo,
    required int stepCount,
    required DateTime moodDate,
  }) async {
    final moodPointDoc = MoodPointDocument(
      pointId: pointId,
      point: point,
      plannedVolume: plannedVolume,
      sleepHours: sleepHours,
      stepCount: stepCount,
      weather: weather,
      memo: memo,
      moodDate: moodDate,
    );
    try {
      await moodPointsCollectionRef
          .doc(moodPointDoc.pointId)
          .update(moodPointDoc.toJson());
    } on FirebaseException catch (e) {
      throw AppException('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodPoint のドキュメントを削除する。
  Future<void> delete({required String pointId}) async {
    try {
      await moodPointsCollectionRef.doc(pointId).delete();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の削除処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodPoint のドキュメントを取得する。
  Future<MoodPoint> get({required String pointId}) async {
    try {
      final doc = await moodPointsCollectionRef.doc(pointId).get();
      if (!doc.exists) throw const AppException('ドキュメントが見つかりませんでした');
      return doc.data()!.toMoodPoint();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodPoint のドキュメントを日付指定で取得する。
  Future<MoodPoint> getByDate({required DateTime moodDate}) async {
    try {
      // 時間情報を削除して日付のみの Timestamp を作成
      final dateOnly = DateTime(moodDate.year, moodDate.month, moodDate.day);
      final startOfDay = Timestamp.fromDate(dateOnly);
      final endOfDay = Timestamp.fromDate(
        dateOnly.add(const Duration(days: 1)).subtract(
              const Duration(seconds: 1),
            ),
      );

      final querySnapshot = await moodPointsCollectionRef
          .where('mood_date', isGreaterThanOrEqualTo: startOfDay)
          .where('mood_date', isLessThanOrEqualTo: endOfDay)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw const AppException('ドキュメントが見つかりませんでした');
      }
      return querySnapshot.docs.first.data().toMoodPoint();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodPoint のドキュメントを全取得する。
  Future<List<MoodPoint>> getAll() async {
    try {
      final querySnapshot = await moodPointsCollectionRef.get();
      return querySnapshot.docs.map((doc) => doc.data().toMoodPoint()).toList();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// [MoodPoint] のドキュメントを購読する。
  Stream<List<MoodPoint>> subscribeMoodPoints() {
    return moodPointsCollectionRef.snapshots().map(
      (snapshot) {
        var moodPointList =
            snapshot.docs.map((doc) => doc.data().toMoodPoint()).toList();
        moodPointList.sort((a, b) => a.moodDate.compareTo(b.moodDate));
        return moodPointList;
      },
    );
  }

  /// 指定された日付の [MoodPoint] が既に存在するか確認する。
  Future<bool> isExist({required DateTime moodDate}) async {
    try {
      // 時間情報を削除して日付のみの Timestamp を作成
      final dateOnly = DateTime(moodDate.year, moodDate.month, moodDate.day);
      final startOfDay = Timestamp.fromDate(dateOnly);
      final endOfDay = Timestamp.fromDate(
        dateOnly.add(const Duration(days: 1)).subtract(
              const Duration(seconds: 1),
            ),
      );

      final querySnapshot = await moodPointsCollectionRef
          .where('mood_date', isGreaterThanOrEqualTo: startOfDay)
          .where('mood_date', isLessThanOrEqualTo: endOfDay)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}

/// Firebase Firestore に保存される気分数値（予定数含む）のドキュメントモデル
class MoodPointDocument {
  MoodPointDocument({
    required this.pointId,
    required this.point,
    required this.plannedVolume,
    required this.sleepHours,
    required this.stepCount,
    required this.weather,
    required this.memo,
    required this.moodDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String pointId;
  final int point;
  final int plannedVolume;
  final double sleepHours;
  final int stepCount;
  final List<Weather> weather;
  final String memo;
  final DateTime moodDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory MoodPointDocument.fromJson(
    String uid,
    Map<String, dynamic> json,
  ) =>
      MoodPointDocument(
        pointId: uid,
        point: json['point'] as int,
        plannedVolume: json['planned_volume'] as int,
        sleepHours: json['sleep_hours'] as double,
        stepCount: json['step_count'] is int ? json['step_count'] as int : 0,
        weather: json['weather'] is List
            ? (json['weather'] as List<dynamic>)
                .map((m) => Weather.fromString(m as String))
                .toList()
            : [],
        memo: json['memo'] is String ? json['memo'] as String : '',
        moodDate: (json['mood_date'] as Timestamp).toDate(),
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'point': point,
        'planned_volume': plannedVolume,
        'sleep_hours': sleepHours,
        'step_count': stepCount,
        'weather': weather.map((m) => m.name).toList(),
        'memo': memo,
        'mood_date': moodDate,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [MoodPointDocument] の拡張
extension on MoodPointDocument {
  /// [MoodPointDocument] を [MoodPoint] に変換する。
  MoodPoint toMoodPoint() => MoodPoint(
        pointId: pointId,
        point: point,
        plannedVolume: plannedVolume,
        sleepHours: sleepHours,
        stepCount: stepCount,
        weather: weather,
        memo: memo,
        moodDate: moodDate,
      );
}
