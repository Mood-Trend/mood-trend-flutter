import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/domain/app_confs.dart';

import 'firebase_provider.dart';

/// [AppConfsRepository] のインスタンスを提供する [Provider]
final appConfsRepositoryProvider = Provider.autoDispose<AppConfsRepository>(
  (ref) => AppConfsRepository(
    appConfsCollectionRef: ref.watch(appConfsCollectionRefProvider),
  ),
);

/// アプリ設定コレクションの参照結果を提供する [Provider].
final appConfsCollectionRefProvider = Provider.autoDispose(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('app_confs')
      .withConverter<AppConfDocument>(
        fromFirestore: (snapshot, _) => AppConfDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (conf, options) => conf.toJson(),
      ),
);

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

/// Firebase Firestore に保存されるユーザーのドキュメントモデル
class AppConfDocument {
  AppConfDocument({required this.value});

  final dynamic value;

  factory AppConfDocument.fromJson(String id, Map<String, dynamic> json) =>
      AppConfDocument(
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };
}
