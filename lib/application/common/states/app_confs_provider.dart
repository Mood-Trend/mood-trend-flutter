import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/app_confs.dart';
import '../../../infrastructure/firebase/app_confs_repository.dart';

/// [AppConfs] を提供する [Provider]
final appConfsProvider = StreamProvider.autoDispose<AppConfs>(
  (ref) => ref.watch(appConfsRepositoryProvider).subScribeAppConfs(),
);
