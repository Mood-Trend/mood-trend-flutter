import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/common/states/is_read_only_provider.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:mood_trend_flutter/presentation/common/setting_page.dart';
import 'package:mood_trend_flutter/utils/datetime_extension.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../utils/app_colors.dart';

// グラフ表示期間を示す列挙体
enum Term {
  /// 1 ヶ月
  month,

  /// 半年
  halfYear,

  /// 1 年
  year,
}

/// 表示期間選択状態を示す [StateProvider]
final selectedTermProvider = StateProvider<Term>((_) => Term.month);

/// グラフの最小値を保持する [StateProvider]
final visibleMinimumProvider = StateProvider<DateTime>(
  (ref) => ref.watch(selectedTermProvider) == Term.month
      ? DateTime.now().subtract(
          const Duration(days: 30),
        )
      : ref.watch(selectedTermProvider) == Term.halfYear
          ? DateTime.now().subtract(
              const Duration(days: 182),
            )
          : DateTime.now().subtract(
              const Duration(days: 365),
            ),
);

/// グラフの最大値を保持する [StateProvider]
final visibleMaximumProvider = StateProvider<DateTime>(
  (ref) => DateTime.now().toDateOnly(),
);

/// グラフを表示するメインの画面
class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTerm = ref.watch(selectedTermProvider);
    final readOnlyState = ref.watch(isReadOnlyProvider);

    // コーチマーク用のターゲット
    final GlobalKey floatingActionButtonKey = GlobalKey();

    // コーチマークのセットアップ
    Future<void> showCoachMark() async {
      final prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
      if (isFirstLaunch) {
        final coachMark = TutorialCoachMark(
          targets: [
            TargetFocus(
              keyTarget: floatingActionButtonKey,
              contents: [
                TargetContent(
                  align: ContentAlign.top,
                  child: Column(
                    children: [
                      Text(
                        S.of(context).homeCoachMarkTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).homeCoachMarkBody,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          colorShadow: Colors.black,
          textSkip: S.of(context).onboardingSkip,
          onFinish: () async {
            await prefs.setBool('isFirstLaunch', false);
          },
        );
        coachMark.show(context: context);
        await prefs.setBool('isFirstLaunch', false);
      }
    }

    // 初回起動時にコーチマークを表示
    Future.delayed(Duration.zero, () {
      showCoachMark();
    });

    ButtonStyle buttonStyle(Term term) {
      return TextButton.styleFrom(
        /// 文字色は選択されている場合は白、そうでない場合は黒
        foregroundColor:
            selectedTerm == term ? AppColors.white : AppColors.black,

        /// 背景色は選択されている場合は緑、そうでない場合は透明
        backgroundColor:
            selectedTerm == term ? AppColors.green : Colors.transparent,
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: Column(
          children: [
            if (readOnlyState.isReadOnly)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '読み取り専用モード',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => ref
                      .read(selectedTermProvider.notifier)
                      .update((state) => Term.year),
                  style: buttonStyle(Term.year),
                  child: Text(S.of(context).homeYear),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => ref
                      .read(selectedTermProvider.notifier)
                      .update((state) => Term.halfYear),
                  style: buttonStyle(Term.halfYear),
                  child: Text(S.of(context).homeHalfYear),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => ref
                      .read(selectedTermProvider.notifier)
                      .update((state) => Term.month),
                  style: buttonStyle(Term.month),
                  child: Text(S.of(context).homeMonth),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => PageNavigator.push(
              context,
              SettingPage(uid: userId),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
