import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/invite_code.dart';
import 'package:uuid/uuid.dart';

import '../../domain/app_exception.dart';
import 'firebase_provider.dart';

/// [InviteRepository] のインスタンスを提供する [Provider]
final inviteRepositoryProvider = Provider<InviteRepository>(
  (ref) => InviteRepository(
    inviteCollectionRef: ref.watch(inviteCollectionRefProvider),
  ),
);

/// Invite コレクションの参照結果を提供する [Provider].
final inviteCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('invites')
      .withConverter<InviteDocument>(
        fromFirestore: (snapshot, _) => InviteDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (inviteDoc, options) => inviteDoc.toJson(),
      ),
);

/// Inviteコレクションのドキュメントを操作するRepository
class InviteRepository {
  InviteRepository({
    required this.inviteCollectionRef,
  });

  final CollectionReference<InviteDocument> inviteCollectionRef;

  /// 招待コードを作成する
  Future<String> createInviteCode(String ownerUid) async {
    try {
      final inviteCode = const Uuid().v4().substring(0, 8);
      final expiresAt = DateTime.now().add(const Duration(days: 7));
      
      await inviteCollectionRef.doc(inviteCode).set(
            InviteDocument(
              id: inviteCode,
              ownerUid: ownerUid,
              expiresAt: expiresAt,
              isUsed: false,
            ),
          );
          
      return inviteCode;
    } on FirebaseException catch (e) {
      throw AppException('Firestore の追加処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// 招待コードを検証して使用する
  Future<String?> validateAndUseInviteCode(String inviteCode) async {
    try {
      final doc = await inviteCollectionRef.doc(inviteCode).get();
      
      if (!doc.exists) {
        throw const AppException('無効な招待コードです');
      }
      
      final invite = doc.data()!;
      
      if (invite.isUsed) {
        throw const AppException('この招待コードは既に使用されています');
      }
      
      if (DateTime.now().isAfter(invite.expiresAt)) {
        throw const AppException('この招待コードは有効期限が切れています');
      }
      
      // 招待コードを使用済みにマーク
      await inviteCollectionRef.doc(inviteCode).update({'is_used': true});
      
      return invite.ownerUid;
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}

/// Firebase Firestore に保存される招待コードのドキュメントモデル
class InviteDocument {
  InviteDocument({
    required this.id,
    required this.ownerUid,
    required this.expiresAt,
    required this.isUsed,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  final String id;
  final String ownerUid;
  final DateTime expiresAt;
  final bool isUsed;
  final DateTime createdAt;

  factory InviteDocument.fromJson(String id, Map<String, dynamic> json) =>
      InviteDocument(
        id: id,
        ownerUid: json['owner_uid'] as String,
        expiresAt: (json['expires_at'] as Timestamp).toDate(),
        isUsed: json['is_used'] as bool,
        createdAt: (json['created_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'owner_uid': ownerUid,
        'expires_at': expiresAt,
        'is_used': isUsed,
        'created_at': createdAt,
      };

  InviteCode toInviteCode() => InviteCode(
        id: id,
        ownerUid: ownerUid,
        expiresAt: expiresAt,
        isUsed: isUsed,
      );
}
