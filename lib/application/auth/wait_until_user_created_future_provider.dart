import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/user_repository.dart';

final waitUntilUserCreatedFutureProvider = FutureProvider.family<void, String>(
  (ref, uid) {
    ref.read(userRepositoryProvider).waitUntilUserCreated(uid);
  },
);
