# SessionEdge

[English](README.md) · [Deutsch](README.de.md) · [Español](README.es.md) · [Français](README.fr.md) · [Italiano](README.it.md) · [Português](README.pt.md) · [Русский](README.ru.md) · **日本語** · [简体中文](README.zh_CN.md)

[DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) 用のプラグインで、セッション操作を画面端の細いバーにまとめます。ポインターを端に動かすと、バーがフレームからスライドして出てきます。ポインターを離すと、バーは戻ります。

![SessionEdge](assets/screenshot.png)

画像付きの手順: [インストールと設定のガイド](docs/GUIDE.ja.md)。

## できること

バーには「ロック」「サスペンド」「ハイバネート」「ログアウト」「再起動」「電源を切る」「シェルを再起動」があります。ボタンはそれぞれ設定で非表示にできます。

これは通常の DMS ポップアウトです。DMS のフレームが接続モードのときはフレームから出てきて、フレームの輪郭と背景を使います。フレームがない場合は普通のポップアウトとして開きます。

バーはどの端にも、DMS バーのある辺にも置けて、その端の始端、中央、終端に揃えられます。ポインターに反応するのは端の短い部分だけで、開くまでに少し遅延があるので、通り過ぎるだけなら閉じたままです。

「サスペンド」「ハイバネート」「ログアウト」「再起動」「電源を切る」はクリックして長押しする必要があり、長押し時間は DMS の電源メニューと同じです。「ロック」と「シェルを再起動」はクリックで実行されます。すべての操作は、電源メニューと同じように DMS のセッションサービスを通して実行されます。

## 動作要件

DankMaterialShell 1.6.1 以降。DMS が対応するすべてのコンポジターで動くはずです。私は niri で使っています。

## インストール

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## 設定

設定 → プラグイン → SessionEdge

| 設定 | デフォルト |
|---|---|
| 端 | 右 |
| 端での位置 / 始端または終端からの距離 | 中央 / 0 px |
| 待機中の帯の幅 | 8 px |
| 感知エリアの長さ | 220 px |
| ボタンのサイズ | 52 px |
| 開くまでの遅延 / 閉じるまでの遅延 | 180 / 500 ms |
| 表示する操作 | ハイバネート以外すべて |

## IPC

```sh
dms ipc call sessionEdge toggle
```

バーを開いたり閉じたりします。たとえば niri のキーバインドからは次のように使います。

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## 翻訳

設定ページはドイツ語、スペイン語、フランス語、イタリア語、ポルトガル語、ロシア語、日本語、簡体字中国語に対応していて、DMS の言語設定に従います。おかしな翻訳があれば、プルリクエストを歓迎します。

## 補足

このプラグインは Claude (Anthropic) の助けを借りて書き、すべての変更を自分の niri デスクトップで試しました。

## ライセンス

MIT
