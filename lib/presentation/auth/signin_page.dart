import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../infrastructure/firebase/auth_repository.dart';
import '../common/error_handler_mixin.dart';
import '../../application/common/url_launcher_service.dart';

import '../../utils/app_colors.dart';
import '../common/components/anchor_text.dart';

/// サインイン画面
class SigninPage extends ConsumerWidget with ErrorHandlerMixin {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.green,
              AppColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green, //ボタンの背景色
                      ),
                      onPressed: () async {
                        run(
                          ref,
                          action: () async {
                            await ref
                                .read(firebaseAuthRepositoryProvider)
                                .signinAnonymously();
                          },
                          successMessage: 'サインインが完了しました',
                        );
                      },
                      child: Text(
                        '同意して始める',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          // color: Theme.of(context).colorScheme.surface,
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: '利用規約',
                        style: AnchorText.anchorStyleText(context),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async => await ref
                              .read(urlLauncherServiceProvider)
                              .launch(
                                  'https://daffodil-cabin-d84.notion.site/de8c281a43e04c3199b1c60a067f3f2f'),
                      ),
                      TextSpan(
                        text: ' と ',
                        style: TextStyle(color: AppColors.black),
                      ),
                      TextSpan(
                        text: 'プライバシーポリシー',
                        style: AnchorText.anchorStyleText(context),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async => await ref
                              .read(urlLauncherServiceProvider)
                              .launch(
                                  'https://daffodil-cabin-d84.notion.site/7c662f7f695a46ee99e679418e3b8083'),
                      ),
                      TextSpan(
                        text: ' に\n同意の上ご利用ください',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
