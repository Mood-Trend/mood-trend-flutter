import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/app_confs_repository.dart';

import '../../../domain/app_confs.dart';

/// [AppConfs] を提供する [Provider]
final appConfsProvider = StreamProvider.autoDispose<AppConfs>(
  (ref) => ref.watch(appConfsRepositoryProvider).subScribeAppConfs(),
);
