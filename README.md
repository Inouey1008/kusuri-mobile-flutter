# kusuri-mobile-flutter

## 開発環境

- Flutter 3.19.6

```sh
fvm use 3.19.6
```

- CocoaPods 1.15.2

```sh
sudo gem uninstall cocoapods
sudo gem install cocoapods -v1.15.2
```

## パッケージのインストール

```sh
fvm flutter pub get
```

## 実行する

```sh
# 開発環境
fvm flutter run --dart-define=FLAVOR=dev

# 本番環境
fvm flutter run --dart-define=FLAVOR=prod
```

## コードの自動生成

```sh
fvm flutter pub run build_runner build
```
