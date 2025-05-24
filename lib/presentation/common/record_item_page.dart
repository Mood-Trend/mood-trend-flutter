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
          return Stack(
            children: [
              ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                children: [
                  const SizedBox(height: 28),
                  AppButtons.outlined(
                    onPressed: () {},
                    isSelected: true,
                    fixedSize: const Size(double.infinity, 100),
                    child: Text(
                      '睡眠時間',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  AppButtons.outlined(
                    onPressed: () {},
                    isSelected: false,
                    fixedSize: const Size(double.infinity, 100),
                    child: Text(
                      '歩数',
                      style: AppTextStyles.body.copyWith(fontSize: 22),
                    ),
                  ),
                  const SizedBox(height: 28),
                  AppButtons.outlined(
                    onPressed: () {},
                    isSelected: true,
                    fixedSize: const Size(double.infinity, 100),
                    child: Text(
                      '天気',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  AppButtons.outlined(
                    onPressed: () {},
                    isSelected: false,
                    fixedSize: const Size(double.infinity, 100),
                    child: Text(
                      '一言メモ',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  )
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
                    child: const Text('保存', style: AppTextStyles.buttonText),
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
