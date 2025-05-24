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
          List<String> items = ['睡眠時間', '歩数', '天気', '一言メモ'];
          List<bool> selected = [true, false, true, false];
          return Stack(
            children: [
              ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                children: [
                  const SizedBox(height: 28),
                  for (int i = 0; i < items.length; i++) ...[
                    AppButtons.outlined(
                      onPressed: () {},
                      isSelected: selected[i],
                      fixedSize: const Size(double.infinity, 100),
                      child: Text(
                        items[i],
                        style: AppTextStyles.body.copyWith(fontSize: 22),
                      ),
                    ),
                    if (i != items.length - 1) const SizedBox(height: 28),
                  ],
                ],
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 32,
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
            ],
          );
        },
        loading: () => const OverlayLoading(),
        error: (e, s) => const SizedBox(),
      ),
    );
  }
}
