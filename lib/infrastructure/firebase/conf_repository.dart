import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/conf.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';
import 'package:mood_trend_flutter/utils/constants.dart';

import '../../domain/app_exception.dart';
import 'firebase_provider.dart';

/// [ConfRepository] のインスタンスを提供する [Provider]
final confRepositoryProvider = Provider<ConfRepository>(
  (ref) => ConfRepository(
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
class ConfRepository {
  ConfRepository({
    required this.confCollectionRef,
  });

  final CollectionReference<ConfDocument> confCollectionRef;

  /// Conf ドキュメントを更新する。
  Future<void> update({
    required String confId,
    int? maxPlannedVolume,
    required bool isOnboardingCompleted,
  }) async {
    final confDoc = ConfDocument(
      confId: confId,
      maxPlannedVolume: maxPlannedVolume ?? defaultMaxPlannedVolume,
      isOnboardingCompleted: isOnboardingCompleted,
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
  Future<Conf?> get() async {
    try {
      final querySnapshot = await confCollectionRef.limit(1).get();
      final docSnapshot = querySnapshot.docs.first;
      if (!docSnapshot.exists) throw const AppException('ドキュメントが見つかりませんでした');
      return docSnapshot.data().toConf();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  Future<void> create() async {
    try {
      await confCollectionRef.add(
        ConfDocument(
          confId: '',
          maxPlannedVolume: 15,
          isOnboardingCompleted: false,
        ),
      );
    } on FirebaseException catch (e) {
      throw AppException('Firestore の追加処理でエラーが発生しました: ${e.code}');
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
    required this.isOnboardingCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String confId;
  final int maxPlannedVolume;
  final bool isOnboardingCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ConfDocument.fromJson(String confId, Map<String, dynamic> json) =>
      ConfDocument(
        confId: confId,
        maxPlannedVolume: json['max_planned_volume'] as int,
        isOnboardingCompleted: json['is_onboarding_completed'] as bool,
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'max_planned_volume': maxPlannedVolume,
        'is_onboarding_completed': isOnboardingCompleted,
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
        isOnboardingCompleted: isOnboardingCompleted,
      );
}
