import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/record_item/states/record_item_notifier.dart';
import 'package:mood_trend_flutter/presentation/common/components/buttons.dart';
import 'package:mood_trend_flutter/presentation/common/theme/app_text_styles.dart';

// 記録する項目の状態をリスト表示するクラス
class RecordItemList extends ConsumerWidget {
  const RecordItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordItems = ref.watch(recordItemNotifierProvider);
    final notifier = ref.read(recordItemNotifierProvider.notifier);
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 28),
      itemCount: recordItems.length,
      itemBuilder: (context, index) {
        final item = recordItems[index];
        return AppButtons.outlined(
          onPressed: () => notifier.toggleSelection(index),
          isSelected: item.selected,
          fixedSize: const Size(double.infinity, 100),
          child: Text(
            item.type.label,
            style: AppTextStyles.body.copyWith(fontSize: 22),
          ),
        );
      },
    );
  }
}
