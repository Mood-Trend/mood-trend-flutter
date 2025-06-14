// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/wait_until_user_created_future_provider.dart';
import '../common/components/loading.dart';
import '../graph/home_page.dart';
import '../../infrastructure/firebase/auth_repository.dart';
import 'onboarding_page.dart';

final rootPageKey = Provider((ref) => GlobalKey<NavigatorState>());

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: ref.watch(rootPageKey),
      body: AuthDependentBuilder(onAuthenticated: (userId) {
        return HomePage(userId: userId);
      }, onUnAuthenticated: () {
        return const OnboardingPage();
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

    final asyncValue = ref.read(waitUntilUserCreatedFutureProvider(userId));
    return asyncValue.when(
      data: (_) => onAuthenticated(userId),
      loading: () => const Center(child: OverlayLoading()),
      error: (e, s) => const SizedBox(),
    );
  }
}
