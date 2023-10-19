# 開発者向けドキュメント

# 設計

## レイヤー

- ui
  - Flutter のコード
  - 画面, ボタン, 色, その他 UI
- api
  - 外部サービスと接続
  - ログ出力, Firebase, ローカル DB その他
- core
  - アプリの中心機能
  - 他レイヤーに依存しないビジネスロジック
- runner
  - ui から命令を受け取る
  - 対応するユースケースを実行
  - core, api に命令する
  - 受け取ったデータで状態を更新する

# Deploy

```
# ビルド
flutter build web --release

# テスト用の一時URLで公開
firebase hosting:channel:deploy test

# デプロイ
firebase deploy --only hosting:elokne
```
