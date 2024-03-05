import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../../application/auth/signin_anonymously_usecase.dart';
import '../common/error_handler_mixin.dart';

class OnboardingPage extends ConsumerWidget with ErrorHandlerMixin {
  const OnboardingPage({super.key, this.isFromSettings = false});

  final bool isFromSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: OverBoard(
        skipText: S.of(context).onboardingSkip,
        nextText: S.of(context).onboardingNext,
        finishText: S.of(context).onboardingStart,
        allowScroll: true,
        buttonColor: AppColors.black,
        activeBulletColor: AppColors.black,
        inactiveBulletColor: AppColors.grey,
        pages: [
          PageModel(
            titleColor: AppColors.black,
            bodyColor: AppColors.black,
            color: AppColors.white,
            imageAssetPath: 'assets/logo.png',
            title: S.of(context).onboardingTitleFirst,
            body: S.of(context).onboardingBodyFirst,
            doAnimateImage: true,
          ),
          PageModel(
            titleColor: AppColors.black,
            bodyColor: AppColors.black,
            color: AppColors.white,
            imageAssetPath: 'assets/graph.png',
            title: S.of(context).onboardingTitleSecond,
            body: S.of(context).onboardingBodySecond,
            doAnimateImage: true,
          ),
          PageModel(
            titleColor: AppColors.black,
            bodyColor: AppColors.black,
            color: AppColors.white,
            imageAssetPath: 'assets/table.png',
            title: S.of(context).onboardingTitleThird,
            body: S.of(context).onboardingBodyThird,
            doAnimateImage: true,
          ),
        ],
        showBullets: true,
        skipCallback: () async {
          if (isFromSettings) {
            PageNavigator.pop(context);
            return;
          }
          await _signinAnonymously(context, ref);
        },
        finishCallback: () async {
          if (isFromSettings) {
            PageNavigator.pop(context);
            return;
          }
          await _signinAnonymously(context, ref);
        },
      ),
    );
  }

  // execute() メソッドを呼び出して共通の処理を行う関数を定義
  Future<void> _signinAnonymously(BuildContext context, WidgetRef ref) async {
    await run(
      ref,
      action: () async =>
          await ref.read(signinAnonymouslyUsecaseProvider).execute(),
      successMessage: S.of(context).onboardingWelcome,
    );
  }
}
