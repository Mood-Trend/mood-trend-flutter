import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/auth_repository.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/conf_repository.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/mood_worksheet_repository.dart';
import 'package:mood_trend_flutter/presentation/mixin/error_handler_mixin.dart';
import 'package:mood_trend_flutter/utils/url_launcher_service.dart';

import 'components/anchor_text.dart';

/// サインイン画面
class SigninPage extends ConsumerWidget with ErrorHandlerMixin {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.primaryContainer,
              colors.primary,
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
                      onPressed: () async {
                        execute(
                          context,
                          ref,
                          action: () async {
                            await ref
                                .read(firebaseAuthRepositoryProvider)
                                .signinAnonymously();
                          },
                          successMessage: 'サインインが完了しました',
                        );
                      },
                      child: const Text(
                        '同意して始める',
                        style: TextStyle(
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
                          color: colors.surface,
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: '利用規約',
                        style: AnchorText.anchorStyleText(context),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async => await ref
                              .read(urlLauncherServiceProvider)
                              .launch(''),
                      ),
                      TextSpan(
                        text: ' と ',
                        style: TextStyle(color: colors.outline),
                      ),
                      TextSpan(
                        text: 'プライバシーポリシー',
                        style: AnchorText.anchorStyleText(context),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async => await ref
                              .read(urlLauncherServiceProvider)
                              .launch(''),
                      ),
                      TextSpan(
                        text: ' に\n同意の上ご利用ください',
                        style: TextStyle(color: colors.outline),
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
