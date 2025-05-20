// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/auth/signout_anonymously_usecase.dart';
import 'package:mood_trend_flutter/application/common/states/app_confs_provider.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/auth/onboarding_page.dart';
import 'package:mood_trend_flutter/presentation/common/components/async_value_handler.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/common/error_handler_mixin.dart';
import 'package:mood_trend_flutter/presentation/auth/root_page.dart';
import 'package:mood_trend_flutter/presentation/common/navigation/navigation_service.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/table_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../../application/common/states/overlay_loading_provider.dart';
import '../../application/common/url_launcher_service.dart';
import '../../domain/app_info.dart';
import 'components/custom_about_dialog.dart';
import 'components/notification_settings_dialog.dart';

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
        title: Text(S.of(context).settingSetting),
      ),
      body: AsyncValueHandler(
        value: asyncValue,
        builder: (appConfs) {
          return ListView(
            children: [],
          );
        },
        loading: () => const OverlayLoading(),
        error: (e, s) => const SizedBox(),
      ),
    );
  }
}
