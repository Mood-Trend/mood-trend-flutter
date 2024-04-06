# mood-trend-flutter

`気分グラフ Mood Trend` のフロントエンド（Flutter）リポジトリです。

## Overview

![mood-trend-logo](/assets/icon.png)

「気分グラフ Mood Trend」は、双極性障害を持つ方々のこころに寄り添う、健康管理アプリです。

【記録】
・気分値と予定量の記録を積み重ねることで自分だけのこころの推移グラフが作成できます。
・予定量の記録により、客観的に気分の波を把握できます。

【サポート】
・自分の気分がわからない時は気分値目安表がサポートします。
・気分値目安表はカスタマイズ可能です。

「気分グラフ Mood Trend」は、双極性障害を持つ方々が日常生活をより安心して過ごすためのパートナーとして、心身の健康をサポートします。

## Environments

Configuration Name|Platform|Connect to Firebase
--|--|--
app-dev|iOS / Android|[mood-trend-dev](https://console.firebase.google.com/u/0/project/mood-trend-dev/overview)
app-prod|iOS / Android|[mood-trend-prod](https://console.firebase.google.com/u/0/project/mood-trend-prod/overview)

## Application Architecture

![application-architecture](/images/aplication_architecture.png)

### Click here for details

- [Flutter × Firebase におけるモダンなアプリケーションアーキテクチャへの挑戦](https://zenn.dev/nozomi_cobo/articles/flutter-firebase-modern-architecture)

## Frontend Architecture

![frontend-architecture](/images/frontend_architecture.png)

4 層のレイヤードアーキテクチャを採用します。
この構成を採用することにより、各フォルダに置くべきファイルが理解しやすくなります。

### Rules

1. Presentation Layer には View に関するコードを記載します。  
直接 Firebase に接続するコードを記載してはいけません。  
Firebase から値の取得が必要な場合は、Application Layer の Usecase クラスのメソッドをコールしてください。  

1. Application Layer には Presentation Layer（View）と Firebase の橋渡しとなるコードを記載します。  

1. Domain Layer にはビジネスロジックとエンティティを記載します。  

1. Infrastructure Layer には具体的なデータの取得や保存の実装を行います。  
例えば、Firebase, API エンドポイント, データベースなどとの通信や操作をこの層で行います。  
直接 View 側のコードから呼ばれることはありません。  

### Click here for details

- [レイヤードアーキテクチャで作る](https://zenn.dev/flutteruniv/books/flutter-architecture/viewer/5_layered-architecture)
