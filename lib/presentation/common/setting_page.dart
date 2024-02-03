// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/application/auth/signout_anonymously_usecase.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/diagnosis/manic_type_diagnosis.dart';
import 'package:mood_trend_flutter/presentation/common/mixin/error_handler_mixin.dart';
import 'package:mood_trend_flutter/presentation/auth/root_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../../application/common/overlay_loading_provider.dart';
import '../../application/common/url_launcher_service.dart';

class SettingPage extends ConsumerWidget with ErrorHandlerMixin {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightGrey,
        centerTitle: true,
        title: const Text("設定"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 30, 16, 8),
            child: Row(
              children: [
                Text(
                  "編集",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () =>
                PageNavigator.push(context, const ManicTypeDiagnosis()),
            child: Container(
              color: AppColors.white,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  "気分値目安表",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 20, 8),
            child: Row(
              children: [
                Text(
                  "サポート",
                  style: TextStyle(
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
                  await ref.read(urlLauncherServiceProvider).launch(''),
              successMessage: '',
            ),
            child: Container(
              color: AppColors.white,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  "お問い合わせ",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 20, 8),
            child: Row(
              children: [
                Text(
                  "アプリについて",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () async => await run(
                  ref,
                  action: () async =>
                      await ref.read(urlLauncherServiceProvider).launch(''),
                  successMessage: '',
                ),
                child: Column(
                  children: [
                    Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
                        child: Text(
                          "アプリを評価する",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Text(
                          "レビューしてもらえると開発者が小躍りします",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
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
                            'https://daffodil-cabin-d84.notion.site/de8c281a43e04c3199b1c60a067f3f2f',
                          ),
                  successMessage: '',
                ),
                child: Container(
                  color: AppColors.white,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Text(
                      "利用規約",
                      style: TextStyle(fontSize: 18),
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
                            'https://daffodil-cabin-d84.notion.site/7c662f7f695a46ee99e679418e3b8083',
                          ),
                  successMessage: '',
                ),
                child: Container(
                  color: AppColors.white,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Text(
                      "プライバシーポリシー",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Row(
              children: [
                Text(
                  "その他",
                  style: TextStyle(
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
                        title: const Text("退会しますか？"),
                        content: const Text("データは全て削除され復元できません"),
                        actions: [
                          TextButton(
                            child: Text(
                              "キャンセル",
                              style: TextStyle(color: AppColors.black),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: Text(
                              "退会する",
                              style: TextStyle(color: AppColors.red),
                            ),
                            onPressed: () {
                              run(
                                ref,
                                action: () async {
                                  await ref
                                      .read(signoutAnonymouslyUseCaseProvider)
                                      .execute();
                                  await PageNavigator.popUntilRoot(context);
                                  await PageNavigator.popUntilRoot(
                                      ref.read(rootPageKey).currentContext!);
                                },
                                successMessage: 'ご利用いただきありがとうございました',
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
                  "退会する",
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
  }
}
