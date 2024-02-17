import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic/manic_type_diagnosis_page.dart';

import 'entity/manic_worksheet.dart';

/// 選択された躁のタイプを元にした登録用エンティティを提供する [StateProvider]
final registerManicEntityProvider = StateProvider.autoDispose.family<
    ManicWorksheet,
    (
      String? plus_1,
      String? plus_2,
      String? plus_3,
      String? plus_4,
      String? plus_5,
    )>(
  (ref, param) => ManicWorksheetFactory.create(
    ref.watch(selectedManicTypeProvider),
    param.$1,
    param.$2,
    param.$3,
    param.$4,
    param.$5,
  ),
);
