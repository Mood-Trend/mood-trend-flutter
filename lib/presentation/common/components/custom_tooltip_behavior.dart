import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../domain/mood_point.dart';
import '../../../generated/l10n.dart';
import '../theme/app_text_styles.dart';
import '../../../utils/app_colors.dart';

TooltipBehavior createCustomTooltipBehavior(BuildContext context) {
  return TooltipBehavior(
    enable: true,
    canShowMarker: false,
    color: AppColors.green,
    // builder プロパティを追加
    builder: (dynamic data, __, ___, ____, _____) {
      // data から必要な情報を取得
      final moodPoint = data as MoodPoint;
      // 日付をフォーマット
      final formattedDate =
          DateFormat('MM/dd', Localizations.localeOf(context).languageCode);
      // 動的なヘッダー文字列を作成
      final dynamicHeader = formattedDate.format(moodPoint.moodDate);

      // ツールチップに表示する内容を構築
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dynamicHeader,
              style: AppTextStyles.selectedButtonText,
            ),
            const SizedBox(height: 4),
            Text(
              '${S.of(context).moodValue}: ${moodPoint.point}',
              style: AppTextStyles.selectedButtonText,
            ),
            Text(
              '${S.of(context).plannedVolume}: ${moodPoint.plannedVolume}',
              style: AppTextStyles.selectedButtonText,
            ),
          ],
        ),
      );
    },
  );
}
