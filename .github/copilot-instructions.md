<!-- I want to review in Japanese. -->
## 要件
- 本PRの目的や、解決しようとしている課題を簡潔に記載してください。
- 例: UIのローカライズ対応 / エラー処理のリファクタリング など

## レビューに関して
レビューする際には、以下のprefix(接頭辞)を付けましょう。
<!-- for GitHub Copilot review rule -->
- [must] → かならず変更してね  
  - 例: [must] 変数名が不明瞭です。`isValid` のようにしてください。
- [imo] → 自分の意見だとこうだけど修正必須ではないよ (in my opinion)  
  - 例: [imo] `final` にしてもよさそうです
- [nits] → ささいな指摘 (nitpick)  
  - 例: [nits] インデントがずれているようです
- [ask] → 質問  
  - 例: [ask] なぜこのような実装にされたのか教えてください
- [fyi] → 参考情報  
  - 例: [fyi] Dartの公式ではこのような使い方が推奨されています
<!-- for GitHub Copilot review rule-->
## PRのルール
- まずはDraftでPRを作成する。
- レビューに出せる状態になったらOpenにする。（レビュワーがランダムにアサインされます）
- レビューなしでのmainブランチへのマージは原則禁止
<!-- I want to review in Japanese. -->