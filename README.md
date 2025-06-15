# go_router_builder_sample

## 初期セットアップ

このプロジェクトはgo_router_builderを使用した自動生成コードを含んでいます。Add commentMore actions
リポジトリをクローンした後、最初に以下のコマンドを実行して必要なコードを生成してください：

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

自動生成のコード（*.g.dartファイル）はGitで無視されているため、アプリを実行する前に必ず上記のコマンドを実行してください。

## Derryコマンド

このプロジェクトではDerryを使用して便利なコマンドを定義しています。以下のように使用できます：

```bash
# コード生成
dart run derry build

# ファイル変更を監視して自動生成
dart run derry watch
```

他にも便利なコマンドが用意されています。詳細は`pubspec.yaml`の`scripts`セクションを参照してください。
