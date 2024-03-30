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
import 'package:mood_trend_flutter/presentation/diagnosis/manic/manic_type_diagnosis_page.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/register_diagnosis_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../../application/common/states/overlay_loading_provider.dart';
import '../../application/common/url_launcher_service.dart';
import '../../domain/app_info.dart';

class SettingPage extends ConsumerWidget with ErrorHandlerMixin {
  const SettingPage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(appConfsProvider);
    return AsyncValueHandler(
      value: asyncValue,
      builder: (appConfs) {
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.lightGrey,
            centerTitle: true,
            title: Text(S.of(context).settingSetting),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 8),
                child: Row(
                  children: [
                    Text(
                      S.of(context).settingEdit,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  popCount++;
                  PageNavigator.push(context, ManicTypeDiagnosisPage(uid: uid))
                      .then((value) => popCount = 0);
                },
                child: Container(
                  color: AppColors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Text(
                      S.of(context).table,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 20, 8),
                child: Row(
                  children: [
                    Text(
                      S.of(context).settingSupport,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async => await run(
                  ref,
                  action: () async =>
                      await ref.read(urlLauncherServiceProvider).launch(
                            ref.read(appInfoProvider).contactUrl.toString(),
                          ),
                  successMessage: '',
                ),
                child: Container(
                  color: AppColors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Text(
                      S.of(context).settingContact,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 20, 8),
                child: Row(
                  children: [
                    Text(
                      S.of(context).settingAboutApp,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  appConfs.isShowReviewMenu
                      ? GestureDetector(
                          onTap: () async => await run(
                            ref,
                            action: () async => await ref
                                .read(urlLauncherServiceProvider)
                                .launch(
                                  Platform.isIOS
                                      ? appConfs.reviewUrlIos
                                      : appConfs.reviewUrlAndroid,
                                ),
                            successMessage: '',
                          ),
                          child: Column(
                            children: [
                              Container(
                                color: AppColors.white,
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 20, 16, 8),
                                  child: Text(
                                    S.of(context).settingReview,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                color: AppColors.white,
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 20),
                                  child: Text(
                                    S.of(context).settingReviewRequest,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  appConfs.isShowReviewMenu
                      ? Divider(
                          height: 0,
                          thickness: 0.7,
                          indent: 16,
                          endIndent: 16,
                          color: AppColors.grey,
                        )
                      : const SizedBox(),
                  GestureDetector(
                    onTap: () {
                      PageNavigator.push(
                          context,
                          const OnboardingPage(
                            isFromSettings: true,
                          ));
                    },
                    child: Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                        child: Text(
                          S.of(context).settingOnboarding,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.7,
                    indent: 16,
                    endIndent: 16,
                    color: AppColors.grey,
                  ),
                  GestureDetector(
                    onTap: () async => await run(
                      ref,
                      action: () async =>
                          await ref.read(urlLauncherServiceProvider).launch(
                                ref
                                    .read(appInfoProvider)
                                    .termsOfServiceUrl
                                    .toString(),
                              ),
                      successMessage: '',
                    ),
                    child: Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                        child: Text(
                          S.of(context).settingTerms,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.7,
                    indent: 16,
                    endIndent: 16,
                    color: AppColors.grey,
                  ),
                  GestureDetector(
                    onTap: () async => await run(
                      ref,
                      action: () async =>
                          await ref.read(urlLauncherServiceProvider).launch(
                                ref
                                    .read(appInfoProvider)
                                    .privacyPolicyUrl
                                    .toString(),
                              ),
                      successMessage: '',
                    ),
                    child: Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                        child: Text(
                          S.of(context).settingPrivacy,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 0.7,
                    indent: 16,
                    endIndent: 16,
                    color: AppColors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      final info = ref.watch(appInfoProvider);
                      showAboutDialog(
                        context: context,
                        applicationName: info.appName,
                        applicationVersion:
                            '${info.version} build${info.buildNumber}',
                        applicationIcon: SizedBox.square(
                          dimension: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(info.iconImagePath),
                          ),
                        ),
                        applicationLegalese: info.copyRight,
                      );
                    },
                    child: Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                        child: Text(
                          S.of(context).version_info,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Row(
                  children: [
                    Text(
                      S.of(context).settingOther,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: ref.read(rootPageKey).currentContext!,
                    builder: (context) {
                      return Stack(
                        children: [
                          AlertDialog(
                            surfaceTintColor: Colors.transparent,
                            backgroundColor: AppColors.white,
                            title: Text(
                              S.of(context).settingWithdraw,
                            ),
                            content: Text(S.of(context).settingWithdrawConfirm),
                            actions: [
                              TextButton(
                                child: Text(
                                  S.of(context).cancel,
                                  style: TextStyle(color: AppColors.black),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: Text(
                                  S.of(context).settingWithdraw,
                                  style: TextStyle(color: AppColors.red),
                                ),
                                onPressed: () {
                                  run(
                                    ref,
                                    action: () async {
                                      await ref
                                          .read(
                                              signoutAnonymouslyUsecaseProvider)
                                          .execute();
                                      await PageNavigator.popUntilRoot(context);
                                      await PageNavigator.popUntilRoot(ref
                                          .read(rootPageKey)
                                          .currentContext!);
                                    },
                                    successMessage: S.of(context).settingThank,
                                  );
                                },
                              ),
                            ],
                          ),
                          if (ref.watch(overlayLoadingProvider))
                            const OverlayLoading(),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  color: AppColors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Text(
                      S.of(context).settingWithdraw,
                      style: TextStyle(color: AppColors.red, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
      loading: () => const OverlayLoading(),
      error: (p0, p1) => Text(p0.toString()),
    );
  }
}
