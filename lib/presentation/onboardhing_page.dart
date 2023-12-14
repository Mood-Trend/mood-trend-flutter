import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OverboardingPage extends StatelessWidget {
  const OverboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: OverBoard(
        skipText: "スキップ",
        nextText: "次へ",
        finishText: "終わる",
        allowScroll: true,
        buttonColor: colors.secondary,
        activeBulletColor: colors.secondary,
        inactiveBulletColor: colors.secondaryContainer,
        pages: [
          PageModel(
            titleColor: colors.secondary,
            bodyColor: colors.secondary,
            color: colors.onInverseSurface,
            imageAssetPath: 'assets/logo.png',
            title: 'ようこそ',
            body: '気分を記録し、穏やかな日々をサポートします',
            doAnimateImage: true,
          ),
          PageModel(
            titleColor: colors.secondary,
            bodyColor: colors.secondary,
            color: colors.onInverseSurface,
            imageAssetPath: 'assets/graph.png',
            title: '気分を記録',
            body: '積み重ねてグラフで確認',
            doAnimateImage: true,
          ),
          PageModel(
            titleColor: colors.secondary,
            bodyColor: colors.secondary,
            color: colors.onInverseSurface,
            imageAssetPath: 'assets/table.png',
            title: '気分値目安表',
            body: '編集して自分専用の表を作ろう',
            doAnimateImage: true,
          ),
        ],
        showBullets: true,
        skipCallback: () {
          // when user select SKIP
          Navigator.pop(context);
        },
        finishCallback: () {
          // when user select NEXT
          Navigator.pop(context);
        },
      ),
    );
  }
}
