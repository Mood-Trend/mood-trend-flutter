import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enum/saving_type.dart';

class SavingStatusNotifier extends AutoDisposeNotifier<SavingType> {
  @override
  SavingType build() => SavingType.none;

  void setSaving() => state = SavingType.saving;

  void setSaved() => state = SavingType.saved;

  void reset() => state = SavingType.none;
}
