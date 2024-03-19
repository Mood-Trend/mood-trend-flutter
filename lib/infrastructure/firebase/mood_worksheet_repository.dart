import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/app_exception.dart';
import '../../domain/mood_worksheet.dart';
import 'firebase_provider.dart';

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

/// MoodWorksheet コレクションのドキュメントを操作する Repository
class MoodWorksheetRepository {
  MoodWorksheetRepository({
    required this.moodWorksheetCollectionRef,
  });

  final CollectionReference<MoodWorksheetDocument> moodWorksheetCollectionRef;

  /// MoodWorksheet ドキュメントを更新する。
  Future<void> update({
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
    final currentWorksheet = await fetch();
    final moodWorksheetDoc = MoodWorksheetDocument(
      worksheetId: currentWorksheet.worksheetId,
      minus_5: minus_5 ?? currentWorksheet.minus_5,
      minus_4: minus_4 ?? currentWorksheet.minus_4,
      minus_3: minus_3 ?? currentWorksheet.minus_3,
      minus_2: minus_2 ?? currentWorksheet.minus_2,
      minus_1: minus_1 ?? currentWorksheet.minus_1,
      plus_1: plus_1 ?? currentWorksheet.plus_1,
      plus_2: plus_2 ?? currentWorksheet.plus_2,
      plus_3: plus_3 ?? currentWorksheet.plus_3,
      plus_4: plus_4 ?? currentWorksheet.plus_4,
      plus_5: plus_5 ?? currentWorksheet.plus_5,
    );
    try {
      await moodWorksheetCollectionRef
          .doc(currentWorksheet.worksheetId)
          .update(moodWorksheetDoc.toJson());
    } on FirebaseException catch (e) {
      throw AppException('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// MoodWorksheet のドキュメントを取得する。
  Stream<MoodWorksheet> subscribe() {
    // StreamController のインスタンスを作成
    final controller = StreamController<MoodWorksheet>();

    // Firestore のドキュメント変更をリッスン
    moodWorksheetCollectionRef.limit(1).snapshots().listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          // ドキュメントを MoodWorksheet に変換してストリームに追加
          try {
            final moodWorksheet = snapshot.docs.first.data().toMoodWorksheet();
            controller.add(moodWorksheet);
          } catch (error) {
            controller.addError(error);
          }
        } else {
          controller.addError(const AppException('ドキュメントが見つかりませんでした'));
        }
      },
      onError: (error) => controller
          .addError(AppException('Firestore の取得処理でエラーが発生しました: $error')),
    );

    // 作成した StreamController のストリームを返す
    return controller.stream;
  }

  /// MoodWorksheet を取得する。
  Future<MoodWorksheet> fetch() async {
    try {
      final snapshot = await moodWorksheetCollectionRef.limit(1).get();
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data().toMoodWorksheet();
      } else {
        throw const AppException('ドキュメントが見つかりませんでした');
      }
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  Future<void> create() async {
    try {
      await moodWorksheetCollectionRef.add(
        MoodWorksheetDocument(
          worksheetId: '',
          minus_5: '',
          minus_4: '',
          minus_3: '',
          minus_2: '',
          minus_1: '',
          plus_1: '',
          plus_2: '',
          plus_3: '',
          plus_4: '',
          plus_5: '',
        ),
      );
    } on FirebaseException catch (e) {
      throw AppException('Firestore の追加処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}

/// Firebase Firestore に保存される気分値目安表のドキュメントモデル
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
