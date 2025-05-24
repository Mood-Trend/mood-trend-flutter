// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/common/states/app_confs_provider.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/common/error_handler_mixin.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/presentation/common/components/buttons.dart';
import 'package:mood_trend_flutter/presentation/common/theme/app_text_styles.dart';

enum RecordItemType {
  sleep("睡眠時間"),
  steps("歩数"),
  weather("天気"),
  memo("一言メモ");

  const RecordItemType(this.label);

  final String label;

  static final Map<String, RecordItemType> _map = {
    for (final item in RecordItemType.values) item.label: item
  };

  static RecordItemType fromLabel(String value) {
    return _map[value] ?? RecordItemType.sleep;
  }
}

class RecordItem {
  final RecordItemType type;
  bool selected;
  RecordItem({required this.type, this.selected = false});
}

final List<RecordItem> recordItems = [
  RecordItem(type: RecordItemType.sleep, selected: true),
  RecordItem(type: RecordItemType.steps, selected: false),
  RecordItem(type: RecordItemType.weather, selected: true),
  RecordItem(type: RecordItemType.memo, selected: false),
];

class RecordItemPage extends ConsumerWidget with ErrorHandlerMixin {
  const RecordItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(appConfsProvider);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightGrey,
        centerTitle: true,
        title: Text(S.of(context).settingRecordItem),
      ),
      body: AsyncValueHandler(
        value: asyncValue,
        builder: (appConfs) {
          return Scaffold(
            backgroundColor: AppColors.lightGrey,
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              children: [
                const SizedBox(height: 28),
                for (int i = 0; i < recordItems.length; i++) ...[
                  AppButtons.outlined(
                    onPressed: () {},
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
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: AppButtons.secondary(
                  onPressed: () {},
                  isSelected: true,
                  child: Text(S.of(context).inputSave,
                      style: AppTextStyles.buttonText),
                ),
              ),
            ),
          );
        },
        loading: () => const OverlayLoading(),
        error: (e, s) => const SizedBox(),
      ),
    );
  }
}
