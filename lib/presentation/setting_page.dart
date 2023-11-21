import 'package:flutter/material.dart';

class SettingModal extends StatefulWidget {
  const SettingModal({super.key});

  @override
  State<SettingModal> createState() => _SettingModalState();
}

class _SettingModalState extends State<SettingModal> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surfaceVariant,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("設定"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("編集"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: colors.onPrimary,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "症状ワークシート",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("サポート"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: colors.onPrimary,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "お問い合わせ",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("アプリについて"),
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
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          "アプリを評価する",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      color: colors.onPrimary,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          "レビューしてもらえると開発者が小躍りします",
                          style: TextStyle(color: colors.outline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: colors.surfaceVariant,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: colors.onPrimary,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "サービス利用規約",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: colors.surfaceVariant,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: colors.onPrimary,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "プライバシーポリシー",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("その他"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: colors.onPrimary,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "退会する",
                  style: TextStyle(color: colors.error, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
