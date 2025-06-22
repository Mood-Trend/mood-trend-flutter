/// 入力値検査例外のエラーコード
enum ValidatorExceptionCode {
  /// 引数が不正
  invalidArgument,

  /// 不明なエラー
  unknown,
  ;
}

/// データベース関連の例外のエラーコード
enum DatabaseExceptionCode {
  /// データが見つからない
  notFound,

  /// 不明なエラー
  unknown,
  ;
}

/// ネットワーク関連の例外のエラーコード
enum NetworkExceptionCode {
  /// 不正なリクエスト
  badRequest,

  /// 不正な認証情報
  badCredentials,

  /// 短期間に無効な認証情報を受け取った
  maximumNumberOfLoginAttemptsExceeded,

  /// データが見つからない
  notFound,

  /// 無効なフィールドが見つかった
  validationFailed,

  /// サービス停止中
  serviceUnavailable,

  /// インターネット接続不可
  noInternetConnection,

  /// 不明なエラー
  unknown,
  ;
}

/// 認証関連の例外のエラーコード
enum AuthExceptionCode {
  /// 不正なメールアドレス
  invalidEmail,

  /// パスワード誤り
  wrongPassword,

  /// パスワードが弱い
  weakPassword,

  /// ユーザーが見つからない
  userNotFound,

  /// ユーザーが無効
  userDisabled,

  /// 短期間に大量のアクセス拒否
  tooManyRequests,

  /// 無効な操作
  operationNotAllowed,

  /// ネットワーク不正
  networkRequestFailed,

  /// 既に使われているメールアドレス
  emailAlreadyInUse,

  /// 異なるユーザーで再認証が実施された
  userMismatch,

  /// アクションコードが不正
  invalidActionCode,

  /// メールアドレスが確認されていない
  notVerifiedEmail,

  /// 最近ログイン済み
  requiresRecentLogin,

  /// 不正な認証情報
  invalidCredential,

  /// 不明なエラー
  unknown,
  ;
}
