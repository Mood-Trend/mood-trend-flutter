// ファイル名などは、プロジェクトの規則に沿って適宜変更してください。

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// FirebaseAnalyticsのインスタンス
final analyticsRepository = Provider((ref) => FirebaseAnalytics.instance);
