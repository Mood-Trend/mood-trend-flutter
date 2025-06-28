import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/exceptions.dart';
import '../provider/repository_provider.dart';

/// [FirebaseAuthRepository] のインスタンスを提供する [Provider]
final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>(
  (ref) => FirebaseAuthRepository(auth: ref.watch(firebaseAuthProvider)),
);

/// [FirebaseAuth]　を操作する Repository
class FirebaseAuthRepository {
  FirebaseAuthRepository({
    required this.auth,
  });

  final FirebaseAuth auth;

  /// 匿名認証を実施する
  Future<String> signinAnonymously() async {
    try {
      // Firebase Auth の匿名認証を実施する
      final userCredential = await auth.signInAnonymously();
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    }
  }

  /// サインアウトする
  Future<void> signOut() async {
    // Firebase Auth からログアウトする
    await auth.signOut();
  }

  /// 認証ユーザーを削除する
  Future<void> delete() async {
    // Firebase Auth から現在のユーザーを削除する
    await auth.currentUser?.delete();
  }
}

/// [FirebaseAuthException] を [AuthException] に変換する拡張メソッド
extension on FirebaseAuthException {
  AuthException toAuthException() {
    switch (code) {
      case 'invalid-email':
        return AuthException.invalidEmail();
      case 'wrong-password':
        return AuthException.wrongPassword();
      case 'weak-password':
        return AuthException.weakPassword();
      case 'user-not-found':
        return AuthException.userNotFound();
      case 'user-disabled':
        return AuthException.userDisabled();
      case 'too-many-requests':
        return AuthException.tooManyRequests();
      case 'operation-not-allowed':
        return AuthException.operationNotAllowed();
      case 'network-request-failed':
        return AuthException.networkRequestFailed();
      case 'email-already-in-use':
      case 'credential-already-in-use':
        return AuthException.emailAlreadyInUse();
      case 'user-mismatch':
        return AuthException.userMismatch();
      case 'invalid-action-code':
        return AuthException.invalidActionCode();
      case 'invalid-credential':
        return AuthException.invalidCredential();
      case 'requires-recent-login':
        return AuthException.requiresRecentLogin();
      case 'internal-error':
      case 'unknown':
        return AuthException.unknown();
      default:
        return AuthException.unknown();
    }
  }
}
