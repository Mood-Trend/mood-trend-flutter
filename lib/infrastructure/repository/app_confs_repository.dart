import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/model/app_confs.dart';
import '../../domain/model/app_conf_document.dart';

/// アプリ設定コレクションのドキュメントを操作する Repository
class AppConfsRepository {
  AppConfsRepository({
    required this.appConfsCollectionRef,
  });

  final CollectionReference<AppConfDocument> appConfsCollectionRef;

  /// アプリ設定のドキュメントをすべてストリームで取得する。
  /// AppConf ドキュメントは value フィールドを持っており、ドキュメント ID によって AppConfs のフィールドを識別する。
  /// 例）ドキュメント ID が 'is_show_review_menu' の場合、AppConfs の isShowReviewMenu フィールドに value を格納する。
  Stream<AppConfs> subScribeAppConfs() {
    return appConfsCollectionRef.snapshots().map((snapshot) {
      final appConfs = <String, dynamic>{};
      for (final doc in snapshot.docs) {
        appConfs[doc.id] = doc.data().value;
      }
      return AppConfs(
        isShowReviewMenu: appConfs['is_show_review_menu'] as bool,
        reviewUrlIos: appConfs['review_url_ios'] as String,
        reviewUrlAndroid: appConfs['review_url_android'] as String,
      );
    });
  }
}
