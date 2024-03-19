import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/mood_point.dart';
import '../../../infrastructure/firebase/mood_point_repository.dart';

/// [MoodPoint] を購読する [StreamProvider]
final subscribeMoodPointsProvider =
    StreamProvider.family<List<MoodPoint>, String>(
  (ref, uid) =>
      ref.watch(moodPointRepositoryProvider(uid)).subscribeMoodPoints(),
);
