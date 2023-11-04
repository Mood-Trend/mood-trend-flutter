import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/app_exception.dart';
import '../../domain/mood_worksheet.dart';
import 'auth_repository.dart';
import 'firebase_provider.dart';

/// [MoodWorksheetRepository] のインスタンスを提供する [Provider]
final confRepositoryProvider = Provider<MoodWorksheetRepository>(
  (ref) => MoodWorksheetRepository(
    moodWorksheetCollectionRef: ref.read(moodWorksheetCollectionRefProvider),
  ),
);

/// MoodWorksheet コレクションの参照結果を提供する [Provider].
final moodWorksheetCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(ref.read(userIdProvider)!)
      .collection('mood_worksheet')
      .withConverter<MoodWorksheetDocument>(
        fromFirestore: (snapshot, _) => MoodWorksheetDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (confDoc, options) => confDoc.toJson(),
      ),
);

/// MoodWorksheet コレクションのドキュメントを操作する Repository
class MoodWorksheetRepository {
  MoodWorksheetRepository({
    required this.moodWorksheetCollectionRef,
  });

  final CollectionReference<MoodWorksheetDocument> moodWorksheetCollectionRef;

  /// MoodWorksheet ドキュメントを更新する。
  Future<void> update({
    required String worksheetId,
    String? minus_5,
    String? minus_4,
    String? minus_3,
    String? minus_2,
    String? minus_1,
    String? plus_1,
    String? plus_2,
    String? plus_3,
    String? plus_4,
    String? plus_5,
  }) async {
    final moodWorksheetDoc = MoodWorksheetDocument(
      worksheetId: worksheetId,
      minus_5: minus_5 ?? '',
      minus_4: minus_4 ?? '',
      minus_3: minus_3 ?? '',
      minus_2: minus_2 ?? '',
      minus_1: minus_1 ?? '',
      plus_1: plus_1 ?? '',
      plus_2: plus_2 ?? '',
      plus_3: plus_3 ?? '',
      plus_4: plus_4 ?? '',
      plus_5: plus_5 ?? '',
    );
    try {
      await moodWorksheetCollectionRef
          .doc(worksheetId)
          .update(moodWorksheetDoc.toJson());
    } on FirebaseException catch (e) {
      throw AppException('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodWorksheet のドキュメントを取得する。
  Future<MoodWorksheet> get() async {
    try {
      final querySnapshot = await moodWorksheetCollectionRef.limit(1).get();
      final docSnapshot = querySnapshot.docs.first;
      if (!docSnapshot.exists) throw const AppException('ドキュメントが見つかりませんでした');
      return docSnapshot.data().toMoodWorksheet();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}

/// Firebase Firestore に保存される症状ワークシートのドキュメントモデル
class MoodWorksheetDocument {
  MoodWorksheetDocument({
    required this.worksheetId,
    required this.minus_5,
    required this.minus_4,
    required this.minus_3,
    required this.minus_2,
    required this.minus_1,
    required this.plus_1,
    required this.plus_2,
    required this.plus_3,
    required this.plus_4,
    required this.plus_5,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String worksheetId;
  final String minus_5;
  final String minus_4;
  final String minus_3;
  final String minus_2;
  final String minus_1;
  final String plus_1;
  final String plus_2;
  final String plus_3;
  final String plus_4;
  final String plus_5;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory MoodWorksheetDocument.fromJson(
    String worksheetId,
    Map<String, dynamic> json,
  ) =>
      MoodWorksheetDocument(
        worksheetId: worksheetId,
        minus_5: json['minus_5'] as String,
        minus_4: json['minus_4'] as String,
        minus_3: json['minus_3'] as String,
        minus_2: json['minus_2'] as String,
        minus_1: json['minus_1'] as String,
        plus_1: json['plus_1'] as String,
        plus_2: json['plus_2'] as String,
        plus_3: json['plus_3'] as String,
        plus_4: json['plus_4'] as String,
        plus_5: json['plus_5'] as String,
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'minus_5': minus_5,
        'minus_4': minus_4,
        'minus_3': minus_3,
        'minus_2': minus_2,
        'minus_1': minus_1,
        'plus_1': plus_1,
        'plus_2': plus_2,
        'plus_3': plus_3,
        'plus_4': plus_4,
        'plus_5': plus_5,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [MoodWorksheetDocument] の拡張
extension on MoodWorksheetDocument {
  /// MoodWorksheetDocument -> MoodWorksheet
  MoodWorksheet toMoodWorksheet() => MoodWorksheet(
        worksheetId: worksheetId,
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
      );
}
