import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/record_item/states/record_item_notifier.dart';
import 'package:mood_trend_flutter/presentation/common/components/buttons.dart';
import 'package:mood_trend_flutter/presentation/common/theme/app_text_styles.dart';

class RecordItemList extends ConsumerWidget {
  const RecordItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordItems = ref.watch(recordItemNotifierProvider);
    final notifier = ref.read(recordItemNotifierProvider.notifier);
    return Column(
      children: [
        for (int i = 0; i < recordItems.length; i++) ...[
          AppButtons.outlined(
            onPressed: () => notifier.toggleSelection(i),
            isSelected: recordItems[i].selected,
            fixedSize: const Size(double.infinity, 100),
            child: Text(
              recordItems[i].type.label,
              style: AppTextStyles.body.copyWith(fontSize: 22),
            ),
          ),
          if (i != recordItems.length - 1) const SizedBox(height: 28),
        ],
      ],
    );
  }
}
