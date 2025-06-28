import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/conf.dart';
import '../../domain/model/conf_document.dart';
import '../../ui/constant/constants.dart';

import '../../ui/utils/app_exception.dart';

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
