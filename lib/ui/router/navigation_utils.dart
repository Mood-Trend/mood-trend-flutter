/// 画面遷移の深さを追跡するグローバル変数
/// 画面が追加されるとインクリメント、画面が閉じられるとデクリメントされる
int popCount = 0;

/// 画面遷移の深さをリセットする
void resetPopCount() {
  popCount = 0;
}

/// 画面遷移の深さを増加させる
void incrementPopCount() {
  popCount++;
}

/// 画面遷移の深さを減少させる
void decrementPopCount() {
  popCount--;
}
