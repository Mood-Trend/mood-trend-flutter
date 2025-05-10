import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/app_user.dart';

import '../../domain/app_exception.dart';
import 'firebase_provider.dart';

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

/// ユーザーコレクションのドキュメントを操作する Repository
class UserRepository {
  UserRepository({
    required this.userCollectionRef,
  });

  final CollectionReference<UserDocument> userCollectionRef;

  /// 指定したユーザー ID のユーザーが Firestore に登録されるまで待つ
  Future<void> waitUntilUserCreated(String uid) async {
    try {
      final snapshots = userCollectionRef.doc(uid).snapshots();
      const timeout = Duration(minutes: 3);
      // Cloud Functions インスタンスの初回起動を考慮して 3 分待つ
      await for (final snapshot in snapshots.timeout(timeout)) {
        if (snapshot.exists &&
            snapshot.data() != null &&
            snapshot.data()!.uid == uid) {
          return;
        }
      }
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } on TimeoutException {
      throw const AppException('Firestore ユーザーの登録に時間がかかりすぎました');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// ユーザーのドキュメントを更新する。
  Future<void> update({
    String? uid,
    String? displayName,
    String? imageUrl,
  }) async {
    final userDoc = UserDocument(
      uid: uid ?? '',
      displayName: displayName ?? '',
      imageUrl: imageUrl ?? '',
    );
    try {
      await userCollectionRef.doc(userDoc.uid).update(userDoc.toJson());
    } on FirebaseException catch (e) {
      throw AppException('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// ユーザーのドキュメントを取得する。
  Future<AppUser?> get(String uid) async {
    try {
      final doc = await userCollectionRef.doc(uid).get();
      return doc.data()?.toAppUser();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// ユーザーのドキュメントを削除する。
  Future<void> delete(String uid) async {
    try {
      await userCollectionRef.doc(uid).delete();
    } on FirebaseException catch (e) {
      throw AppException('Firestore の削除処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
  
  /// ユーザーに支援者を追加する
  Future<void> addSupporter({
    required String uid,
    required String supporterId,
  }) async {
    try {
      await userCollectionRef.doc(uid).update({
        'supporter_ids': FieldValue.arrayUnion([supporterId]),
      });
    } on FirebaseException catch (e) {
      throw AppException('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// ユーザーが特定のユーザーの支援者かどうかをチェックする
  Future<bool> isSupporterOf(String supporterId, String ownerUid) async {
    try {
      final doc = await userCollectionRef.doc(ownerUid).get();
      if (!doc.exists) return false;
      
      final userData = doc.data();
      if (userData == null) return false;
      
      final supporterIds = userData.supporterIds;
      return supporterIds.contains(supporterId);
    } on FirebaseException catch (e) {
      throw AppException('Firestore の取得処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}

/// Firebase Firestore に保存されるユーザーのドキュメントモデル
class UserDocument {
  UserDocument({
    required this.uid,
    required this.displayName,
    required this.imageUrl,
    this.supporterIds = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String uid;
  final String displayName;
  final String imageUrl;
  final List<String> supporterIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserDocument.fromJson(String uid, Map<String, dynamic> json) =>
      UserDocument(
        uid: uid,
        displayName: json['display_name'] as String,
        imageUrl: json['image_url'] as String,
        supporterIds: json['supporter_ids'] != null 
            ? List<String>.from(json['supporter_ids'] as List)
            : const [],
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'display_name': displayName,
        'image_url': imageUrl,
        'supporter_ids': supporterIds,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [UserDocument] の拡張
extension on UserDocument {
  /// UserDocument -> AppUser
  AppUser toAppUser() => AppUser(
        uid: uid,
        displayName: displayName,
        imageUrl: imageUrl,
        supporterIds: supporterIds,
      );
}
