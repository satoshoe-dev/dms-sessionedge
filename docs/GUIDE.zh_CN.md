# SessionEdge：分步指南

[English](GUIDE.md) · [Deutsch](GUIDE.de.md) · [Español](GUIDE.es.md) · [Français](GUIDE.fr.md) · [Italiano](GUIDE.it.md) · [Português](GUIDE.pt.md) · [Русский](GUIDE.ru.md) · [日本語](GUIDE.ja.md) · **简体中文**

## 1. 安装插件

从插件注册表安装：

```sh
dms plugins install sessionEdge
```

或者将仓库克隆到 DMS 插件目录：

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. 启用插件

打开 设置 → 插件。SessionEdge 会出现在列表中，将它打开。

![列出 SessionEdge 的插件列表](images/01-plugin-list.png)

如果没有出现，请在该页面点击“扫描”，或用 `dms restart` 重启外壳。

## 3. 选择边缘

在插件列表中展开 SessionEdge 查看其设置。选择会话栏所在的边缘，以及它在该边缘上的位置。

![SessionEdge 设置](images/02-settings.png)

当 DMS 框架处于连接模式时，会话栏会从框架中滑出。在状态栏所在的一侧，停靠区域最宽。

## 4. 打开会话栏

将指针移到所选边缘并停留片刻，会话栏就会滑出。

![右侧边缘的会话栏](images/03-strip.png)

只有边缘上的一小段会响应（默认 220 px），因此指针只是经过时会话栏不会打开。如果太容易打开或打开太慢，请调整“感应区长度”和“打开延迟”。

## 5. 执行操作

锁定和“重启外壳”单击即可执行。挂起、休眠、注销、重启和关机需要点击并按住。按住期间按钮会逐渐填满。

![按住“注销”按钮](images/04-hold.png)

提前松开即可取消。

## 6. 选择按钮

在设置底部关闭不需要的操作。休眠仅在系统支持时显示。

## 7. 用快捷键打开（可选）

```sh
dms ipc call sessionEdge toggle
```

在 niri 中，将以下内容添加到配置：

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
