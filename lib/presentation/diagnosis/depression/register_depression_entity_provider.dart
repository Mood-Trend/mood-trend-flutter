import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'depression_type_diagnosis_page.dart';
import 'entity/depression_worksheet.dart';

/// 選択された鬱のタイプを元にした登録用エンティティを提供する [StateProvider]
final registerDepressionEntityProvider = StateProvider.autoDispose.family<
    DepressionWorksheet,
    (
      String? minus_1,
      String? minus_2,
      String? minus_3,
      String? minus_4,
      String? minus_5,
    )>(
  (ref, param) => DepressionWorksheetFactory.create(
    ref.watch(selectedDepressionTypeProvider),
    param.$1,
    param.$2,
    param.$3,
    param.$4,
    param.$5,
  ),
);
