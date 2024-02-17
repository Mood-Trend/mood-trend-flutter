import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'depression_type_diagnosis_page.dart';
import 'entity/depression_worksheet.dart';

/// 選択された鬱のタイプを元にした登録用エンティティを提供する [StateProvider]
final registerDepressionEntityProvider =
    StateProvider.autoDispose<DepressionWorksheet>(
  (ref) {
    final param = ref.watch(selfInputDepressionProvider);
    return DepressionWorksheetFactory.create(
      ref.watch(selectedDepressionTypeProvider),
      param.$1,
      param.$2,
      param.$3,
      param.$4,
      param.$5,
    );
  },
);

/// 手入力した場合の入力文字列を提供する [StateProvider]
final selfInputDepressionProvider = StateProvider<
    (
      String? minus_1,
      String? minus_2,
      String? minus_3,
      String? minus_4,
      String? minus_5,
    )>(
  (_) => (null, null, null, null, null),
);
