import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';

import '../../application/auth/signin_anonymously_usecase.dart';
import '../common/mixin/error_handler_mixin.dart';

class OnboardingPage extends ConsumerWidget with ErrorHandlerMixin {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: OverBoard(
        skipText: "スキップ",
        nextText: "　つぎへ",
        finishText: "はじめる",
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
            title: 'ようこそ',
            body: '気分を記録し、穏やかな日々をサポートします',
            doAnimateImage: true,
          ),
          PageModel(
            titleColor: AppColors.black,
            bodyColor: AppColors.black,
            color: AppColors.white,
            imageAssetPath: 'assets/graph.png',
            title: '気分を記録',
            body: '積み重ねてグラフで確認',
            doAnimateImage: true,
          ),
          PageModel(
            titleColor: AppColors.black,
            bodyColor: AppColors.black,
            color: AppColors.white,
            imageAssetPath: 'assets/table.png',
            title: '気分値目安表',
            body: '編集して自分専用の表を作ろう',
            doAnimateImage: true,
          ),
        ],
        showBullets: true,
        skipCallback: () async => await _signinAnonymously(context, ref),
        finishCallback: () async => await _signinAnonymously(context, ref),
      ),
    );
  }

  // execute() メソッドを呼び出して共通の処理を行う関数を定義
  Future<void> _signinAnonymously(BuildContext context, WidgetRef ref) async {
    await run(
      ref,
      action: () async =>
          await ref.read(signinAnonymouslyUsecaseProvider).execute(),
      successMessage: '気分グラフへようこそ！',
    );
  }
}
