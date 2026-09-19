# SessionEdge

**English** · [Deutsch](README.de.md) · [Español](README.es.md) · [Français](README.fr.md) · [Italiano](README.it.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [日本語](README.ja.md) · [简体中文](README.zh_CN.md)

A plugin for [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) that keeps the session actions in a slim strip at a screen edge. Move the pointer to the edge and the strip slides out of the frame. Move it away and the strip slides back.

![SessionEdge](assets/screenshot.png)

Step by step with pictures: [installation and setup guide](docs/GUIDE.md).

## What it does

The strip holds lock, suspend, hibernate, log out, reboot, power off and a shell restart. Each button can be hidden in the settings.

It is a regular DMS popout. With the DMS frame in connected mode it comes out of the frame and uses the frame's outline and background. Without the frame it opens as a normal popout.

You can put it on any edge or on the side of your DMS bar, and align it to the start, center or end of that edge. Only a short part of the edge reacts to the pointer, and there is a small delay before it opens, so it stays closed when you just move past.

Suspend, hibernate, log out, reboot and power off need a click and hold, with the same hold time as the DMS power menu. Lock and the shell restart run on click. All actions go through the DMS session services, the same way the power menu does it.

## Requirements

DankMaterialShell 1.6.1 or newer. It should work on every compositor DMS supports. I use it on niri.

## Installation

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## Settings

Settings → Plugins → SessionEdge

| Setting | Default |
|---|---|
| Edge | right |
| Position along the edge / offset | center / 0 px |
| Idle strip width | 8 px |
| Length of the sensitive zone | 220 px |
| Button size | 52 px |
| Open / close delay | 180 / 500 ms |
| Visible actions | all except hibernate |

## IPC

```sh
dms ipc call sessionEdge toggle
```

This opens or closes the strip, for example from a keybind in niri:

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## Translations

The settings page is available in German, Spanish, French, Italian, Portuguese, Russian, Japanese and Simplified Chinese and follows the language set in DMS. If a translation reads wrong, a pull request is welcome.

## Note

I wrote this plugin with help from Claude (Anthropic) and tested every change on my own niri desktop.

## License

MIT
