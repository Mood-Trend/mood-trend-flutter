import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/exceptions.dart';

/// [FirebaseAuth] のインスタンスを提供する [Provider].
final _authProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

/// [FirebaseAuth] の [User] を返す [StreamProvider].
/// ユーザーの認証状態が変更される（ログイン、ログアウトする）たびに更新される。
final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(_authProvider).userChanges(),
);

/// 現在のユーザー ID を提供する [Provider].
final userIdProvider = Provider<String?>((ref) {
  ref.watch(authUserProvider);
  return ref.watch(_authProvider).currentUser?.uid;
});

/// ユーザーがログインしているかどうかを示す bool 値を提供する Provider.
/// [userIdProvider] の変更を watch しているので、ユーザーの認証状態が変更される
/// たびに、この [Provider] も更新される。
final isSignedInProvider = Provider<bool>(
  (ref) => ref.watch(userIdProvider) != null,
);

/// [FirebaseAuthRepository] のインスタンスを提供する [Provider]
final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>(
  (ref) => FirebaseAuthRepository(auth: ref.watch(_authProvider)),
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

  /// Googleアカウントでサインインする
  Future<String> signInWithGoogle() async {
    try {
      // GoogleSignIn インスタンスを作成
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Googleサインインダイアログを表示
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw AuthException.userNotFound();
      }

      // 認証情報を取得
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Firebaseの認証情報を作成
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase Auth でサインイン
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e) {
      throw AuthException.unknown();
    }
  }

  /// 匿名アカウントをGoogleアカウントにリンクする
  Future<String> linkAnonymousWithGoogle() async {
    try {
      // 現在のユーザーが匿名かチェック
      final User? currentUser = auth.currentUser;
      if (currentUser == null || !currentUser.isAnonymous) {
        throw AuthException.operationNotAllowed();
      }

      // GoogleSignIn インスタンスを作成
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Googleサインインダイアログを表示
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw AuthException.userNotFound();
      }

      // 認証情報を取得
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Firebaseの認証情報を作成
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 匿名アカウントをGoogleアカウントにリンク
      final UserCredential userCredential =
          await currentUser.linkWithCredential(credential);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e) {
      throw AuthException.unknown();
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
        return AuthException.emailAlreadyInUse();
      case 'credential-already-in-use':
        return AuthException.credentialAlreadyInUse();
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
