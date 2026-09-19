# SessionEdge: step by step

**English** · [Deutsch](GUIDE.de.md) · [Español](GUIDE.es.md) · [Français](GUIDE.fr.md) · [Italiano](GUIDE.it.md) · [Português](GUIDE.pt.md) · [Русский](GUIDE.ru.md) · [日本語](GUIDE.ja.md) · [简体中文](GUIDE.zh_CN.md)

## 1. Install the plugin

From the plugin registry:

```sh
dms plugins install sessionEdge
```

Or clone the repository into your DMS plugin folder:

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. Enable it

Open Settings → Plugins. SessionEdge shows up in the list. Switch it on.

![Plugin list with SessionEdge](images/01-plugin-list.png)

If it does not appear, click "Scan" on that page or restart the shell with `dms restart`.

## 3. Pick an edge

Expand SessionEdge in the plugin list to see its settings. Choose the edge where the strip should live and where along that edge it sits.

![SessionEdge settings](images/02-settings.png)

With the DMS frame in connected mode the strip slides out of the frame. On the side of your bar the docking area is widest.

## 4. Open the strip

Move the pointer to the chosen edge and rest it there for a moment. The strip slides out.

![The strip on the right edge](images/03-strip.png)

Only a short part of the edge reacts (220 px by default), so the strip does not open when you just move past. Adjust "Length of the sensitive zone" and "Open delay" if it opens too easily or too late.

## 5. Use an action

Lock and "Restart shell" run on click. Suspend, hibernate, log out, reboot and power off need a click and hold. The button fills up while you hold it.

![Holding the log out button](images/04-hold.png)

Release early to cancel.

## 6. Choose the buttons

Switch off the actions you do not need at the bottom of the settings. Hibernate only appears if your system supports it.

## 7. Open it with a keybind (optional)

```sh
dms ipc call sessionEdge toggle
```

In niri, add to your config:

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
