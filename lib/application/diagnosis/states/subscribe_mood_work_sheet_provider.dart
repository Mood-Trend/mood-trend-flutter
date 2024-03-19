import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/mood_worksheet.dart';
import '../../../infrastructure/firebase/mood_worksheet_repository.dart';

/// [MoodWorksheet] を購読する [StreamProvider]
final subscribeMoodWorksheetProvider =
    StreamProvider.family<MoodWorksheet, String>(
  (ref, uid) => ref.watch(moodWorksheetRepositoryProvider(uid)).subscribe(),
);
