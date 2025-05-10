import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/app_exception.dart';

import 'firebase_provider.dart';

/// [DataMigrationService] のインスタンスを提供する [Provider]
final dataMigrationServiceProvider = Provider<DataMigrationService>(
  (ref) => DataMigrationService(
    firestore: ref.watch(firebaseFirestoreProvider),
  ),
);

/// データ移行サービス
///
/// 匿名アカウントからGoogleアカウント、またはGoogleアカウントから別のアカウントへのデータ移行を行う
class DataMigrationService {
  DataMigrationService({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  /// ソースユーザーからターゲットユーザーへデータを移行する
  ///
  /// 移行が成功した場合は `true` を返し、失敗した場合は例外をスローします
  Future<bool> migrateUserData({
    required String sourceUid,
    required String targetUid,
  }) async {
    try {
      // トランザクションを開始
      return await firestore.runTransaction<bool>((transaction) async {
        // 移行するコレクション
        final collections = ['conf', 'mood_points', 'mood_worksheet'];

        // 各コレクションのデータを移行
        for (final collectionName in collections) {
          // ソースユーザーのコレクションを取得
          final sourceCollectionRef = firestore
              .collection('users')
              .doc(sourceUid)
              .collection(collectionName);

          final sourceSnapshot = await sourceCollectionRef.get();

          // ターゲットユーザーのコレクションへの参照
          final targetCollectionRef = firestore
              .collection('users')
              .doc(targetUid)
              .collection(collectionName);

          // ターゲットコレクションの既存データを削除（上書きモード）
          final targetSnapshot = await targetCollectionRef.get();
          for (final doc in targetSnapshot.docs) {
            transaction.delete(doc.reference);
          }

          // ソースのデータをターゲットにコピー
          for (final doc in sourceSnapshot.docs) {
            final targetDocRef = targetCollectionRef.doc();
            transaction.set(targetDocRef, doc.data());
          }
        }

        return true;
      });
    } on FirebaseException catch (e) {
      throw AppException('データ移行中にエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }
}
