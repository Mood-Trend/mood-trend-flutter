import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_trend_flutter/presentation/home_page.dart';
import 'package:mood_trend_flutter/presentation/signin_page.dart';

import '../infrastructure/firebase/auth_repository.dart';

final rootPageKey = Provider((ref) => GlobalKey<NavigatorState>());

class RootPage extends HookConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: ref.watch(rootPageKey),
      body: AuthDependentBuilder(onAuthenticated: (userId) {
        return HomePage(userId: userId);
      }, onUnAuthenticated: () {
        return const SigninPage();
      }),
    );
  }
}

/// Firebase に Auth にサインイン済みの場合にのみ [onAuthenticated] で渡した
/// ウィジェットを表示する。
/// その際、サインイン済みのユーザーの `userId` が使用できる。
class AuthDependentBuilder extends ConsumerWidget {
  const AuthDependentBuilder({
    super.key,
    required this.onAuthenticated,
    required this.onUnAuthenticated,
  });

  /// Firebase Auth にサインイン済みの場合に表示されるウィジェットを `userId` とともに
  /// 返すビルダー関数。
  final Widget Function(String userId) onAuthenticated;

  /// Firebase Auth にサインインしていない場合に表示されるウィジェットを返すビルダー関数（任意）
  final Widget Function() onUnAuthenticated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    if (userId == null) {
      return onUnAuthenticated();
    }
    return onAuthenticated(userId);
  }
}
