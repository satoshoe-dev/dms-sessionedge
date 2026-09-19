# SessionEdge: ステップごとの手順

[English](GUIDE.md) · [Deutsch](GUIDE.de.md) · [Español](GUIDE.es.md) · [Français](GUIDE.fr.md) · [Italiano](GUIDE.it.md) · [Português](GUIDE.pt.md) · [Русский](GUIDE.ru.md) · **日本語** · [简体中文](GUIDE.zh_CN.md)

## 1. プラグインをインストールする

リポジトリを DMS のプラグインフォルダーにクローンします。

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. 有効にする

設定 → プラグイン を開きます。一覧に SessionEdge が表示されるので、オンにします。

![SessionEdge が表示されたプラグイン一覧](images/01-plugin-list.png)

表示されない場合は、そのページで「スキャン」をクリックするか、`dms restart` でシェルを再起動します。

## 3. 画面端を選ぶ

プラグイン一覧で SessionEdge を展開すると、設定が表示されます。セッションバーを置く画面端と、その端のどこに置くかを選びます。

![SessionEdge の設定](images/02-settings.png)

DMS のフレームが接続モードのときは、セッションバーがフレームからスライドして出てきます。DMS バーのある側では、ドッキングできる範囲が最も広くなります。

## 4. セッションバーを開く

選んだ画面端にポインターを移動し、少しの間そのまま止めます。セッションバーがスライドして現れます。

![右端のセッションバー](images/03-strip.png)

反応するのは画面端の短い範囲だけ（標準では 220 px）なので、ポインターが通り過ぎただけでは開きません。開きやすすぎる場合や開くのが遅い場合は、「感知エリアの長さ」と「開くまでの遅延」を調整します。

## 5. 操作を実行する

ロックと「シェルを再起動」はクリックで実行されます。サスペンド、ハイバネート、ログアウト、再起動、電源オフは、クリックしたまま長押しする必要があります。長押ししている間、ボタンが満たされていきます。

![「ログアウト」ボタンを長押ししているところ](images/04-hold.png)

途中で離すとキャンセルされます。

## 6. ボタンを選ぶ

使わない操作は、設定の下部でオフにします。ハイバネートは、システムが対応している場合のみ表示されます。

## 7. キーバインドで開く（任意）

```sh
dms ipc call sessionEdge toggle
```

niri では、設定ファイルに次を追加します。

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
