import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/table_page.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

import '../utils/url_launcher_service.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.onInverseSurface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.onInverseSurface,
        centerTitle: true,
        title: const Text("設定"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 8),
            child: Row(
              children: [
                Text(
                  "編集",
                  style: TextStyle(fontSize: 16, color: colors.outline),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () =>
                PageNavigator.push(context, const TablePage(isEditMode: true)),
            child: Container(
              color: colors.onPrimary,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  "症状ワークシート",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 20, 8),
            child: Row(
              children: [
                Text(
                  "サポート",
                  style: TextStyle(fontSize: 16, color: colors.outline),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: colors.onPrimary,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 20, 8),
            child: Row(
              children: [
                Text(
                  "アプリについて",
                  style: TextStyle(fontSize: 16, color: colors.outline),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      color: colors.onPrimary,
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
                      color: colors.onPrimary,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Text(
                          "レビューしてもらえると開発者が小躍りします",
                          style: TextStyle(color: colors.outline, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: colors.surfaceVariant,
              ),
              GestureDetector(
                onTap: () async {
                  await ref.read(urlLauncherServiceProvider).launch(
                      'https://daffodil-cabin-d84.notion.site/de8c281a43e04c3199b1c60a067f3f2f');
                },
                child: Container(
                  color: colors.onPrimary,
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
                thickness: 1,
                indent: 16,
                endIndent: 16,
                color: colors.surfaceVariant,
              ),
              GestureDetector(
                onTap: () async {
                  await ref.read(urlLauncherServiceProvider).launch(
                      'https://daffodil-cabin-d84.notion.site/7c662f7f695a46ee99e679418e3b8083');
                },
                child: Container(
                  color: colors.onPrimary,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Row(
              children: [
                Text(
                  "その他",
                  style: TextStyle(fontSize: 16, color: colors.outline),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: colors.onPrimary,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  "退会する",
                  style: TextStyle(color: colors.error, fontSize: 18),
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
