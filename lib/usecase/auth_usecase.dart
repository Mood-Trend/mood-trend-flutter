import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/app_user/user_repository.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/authentication/auth_repository.dart';
import 'package:mood_trend_flutter/usecase/run_usecase_mixin.dart';

/// [FirebaseAuth] のインスタンスを提供する [Provider].
final authUsecaseProvider = Provider.autoDispose<AuthUsecase>(
  (ref) => AuthUsecase(
    ref: ref,
    authRepository: ref.read(
      firebaseAuthRepositoryProvider,
    ),
    userRepository: ref.read(
      firebaseUserRepositoryProvider,
    ),
  ),
);

/// [FirebaseAuthRepository] のインスタンスを提供する [Provider].
class AuthUsecase with RunUsecaseMixin {
  const AuthUsecase({
    required this.ref,
    required this.authRepository,
    required this.userRepository,
  });

  final Ref ref;
  final FirebaseAuthRepository authRepository;
  final FirebaseUserRepository userRepository;

  /// [FirebaseAuth] に匿名アカウントでサインインする
  Future<void> signInAnonymously() async {
    return await execute(ref, () async {
      final uid = await authRepository.signinAnonymously();
      // 匿名認証でサインインしたユーザーが Firestore に登録されるまで待つ
      await userRepository.waitUntilUserCreated(uid);
    });
  }

  /// [FirebaseAuth] からサインアウトする
  Future<void> signOut() async {
    await execute(ref, () async {
      await authRepository.signOut();
    });
  }
}
