// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import '../utils/error_handler_mixin.dart';
import '../style/app_colors.dart';
import '../component/buttons.dart';
import '../style/app_text_styles.dart';
import '../component/record_item_list.dart';

// 記録する項目を選択するページ
class RecordItemPage extends ConsumerWidget with ErrorHandlerMixin {
  const RecordItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightGrey,
        centerTitle: true,
        title: Text(S.of(context).settingRecordItem),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: const RecordItemList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: SizedBox(
          width: double.infinity,
          height: 64,
          child: AppButtons.secondary(
            onPressed: () {},
            isSelected: true,
            child:
                Text(S.of(context).inputSave, style: AppTextStyles.buttonText),
          ),
        ),
      ),
    );
  }
}
