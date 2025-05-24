import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic/selected_manic_type_notifier.dart';

import 'entity/manic_worksheet.dart';

/// 選択された躁のタイプを元にした登録用エンティティを提供する [StateProvider]
final registerManicEntityProvider = StateProvider.autoDispose<ManicWorksheet>(
  (ref) {
    final param = ref.watch(selfInputManicProvider);
    return ManicWorksheetFactory.create(
      ref.watch(selectedManicTypeNotifierProvider),
      param.$1,
      param.$2,
      param.$3,
      param.$4,
      param.$5,
    );
  },
);

/// 手入力した場合の入力文字列を提供する [StateProvider]
final selfInputManicProvider = StateProvider<
    (
      String? plus_1,
      String? plus_2,
      String? plus_3,
      String? plus_4,
      String? plus_5,
    )>(
  (_) => (null, null, null, null, null),
);
