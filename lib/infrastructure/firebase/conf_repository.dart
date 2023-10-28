import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/conf.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';
import 'package:mood_trend_flutter/utils/constants.dart';

import '../../domain/app_exception.dart';
import 'firebase_provider.dart';

/// [FirebaseConfRepository] のインスタンスを提供する [Provider]
final firebaseConfRepositoryProvider = Provider<FirebaseConfRepository>(
  (ref) => FirebaseConfRepository(
    confCollectionRef: ref.read(confCollectionRefProvider),
  ),
);

/// Conf コレクションの参照結果を提供する [Provider].
final confCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(ref.read(userIdProvider)!)
      .collection('conf')
      .withConverter<ConfDocument>(
        fromFirestore: (snapshot, _) => ConfDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (confDoc, options) => confDoc.toJson(),
      ),
);

/// Conf コレクションのドキュメントを操作する Repository
class FirebaseConfRepository {
  FirebaseConfRepository({
    required this.confCollectionRef,
  });

  final CollectionReference<ConfDocument> confCollectionRef;

  /// Conf ドキュメントを更新する。
  Future<void> update(
    String confId, {
    int? maxPlannedVolume,
  }) async {
    final confDoc = ConfDocument(
      confId: confId,
      maxPlannedVolume: maxPlannedVolume ?? defaultMaxPlannedVolume,
    );
    try {
      await confCollectionRef.doc(confDoc.confId).update(confDoc.toJson());
    } on FirebaseException catch (e) {
      throw AppException('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// Conf のドキュメントを取得する。
  Future<Conf?> get(String confId) async {
    try {
      final doc = await confCollectionRef.doc(confId).get();
      return doc.data()?.toConf();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// Conf のドキュメントを削除する。
  Future<void> delete(String confId) async {
    try {
      await confCollectionRef.doc(confId).delete();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の削除処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}

/// Firebase Firestore に保存される Conf のドキュメントモデル
class ConfDocument {
  ConfDocument({
    required this.confId,
    required this.maxPlannedVolume,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String confId;
  final int maxPlannedVolume;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ConfDocument.fromJson(String confId, Map<String, dynamic> json) =>
      ConfDocument(
        confId: confId,
        maxPlannedVolume: json['max_planned_volume'] as int,
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  /// TimeStampConver を使う
  Map<String, dynamic> toJson() => {
        'max_planned_volume': maxPlannedVolume,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [ConfDocument] の拡張
extension on ConfDocument {
  /// UserDocument -> AppUser
  Conf toConf() => Conf(
        confId: confId,
        maxPlannedVolume: maxPlannedVolume,
      );
}
