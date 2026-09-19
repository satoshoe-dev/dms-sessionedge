# SessionEdge

[English](README.md) · **Deutsch** · [Español](README.es.md) · [Français](README.fr.md) · [Italiano](README.it.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [日本語](README.ja.md) · [简体中文](README.zh_CN.md)

Ein Plugin für [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell), das die Sitzungsaktionen in einer schmalen Leiste an einer Bildschirmkante bereithält. Fährt man mit dem Zeiger an die Kante, gleitet die Leiste aus dem Rahmen heraus. Zieht man ihn weg, fährt die Leiste wieder ein.

![SessionEdge](assets/screenshot.png)

Schritt für Schritt mit Bildern: [Anleitung zu Installation und Einrichtung](docs/GUIDE.de.md).

## Was das Plugin macht

Die Leiste enthält Sperren, Ruhemodus, Ruhezustand, Abmelden, Neustart, Ausschalten und Oberfläche neu starten. Jede Schaltfläche lässt sich in den Einstellungen ausblenden.

Sie ist ein gewöhnliches DMS-Popout. Läuft der DMS-Rahmen im verbundenen Modus, kommt sie aus dem Rahmen heraus und übernimmt dessen Umriss und Hintergrund. Ohne Rahmen öffnet sie sich als normales Popout.

Man kann sie an jede Kante oder an die Seite der DMS-Leiste legen und am Anfang, in der Mitte oder am Ende dieser Kante ausrichten. Nur ein kurzer Abschnitt der Kante reagiert auf den Zeiger, und bis zum Öffnen vergeht eine kleine Verzögerung. So bleibt sie zu, wenn man nur vorbeifährt.

Ruhemodus, Ruhezustand, Abmelden, Neustart und Ausschalten muss man anklicken und gedrückt halten, mit derselben Haltedauer wie im DMS-Energiemenü. Sperren und Oberfläche neu starten wirken schon beim Klick. Alle Aktionen laufen über die Sitzungsdienste von DMS, genau wie beim Energiemenü.

## Voraussetzungen

DankMaterialShell 1.6.1 oder neuer. Es sollte mit jedem Compositor laufen, den DMS unterstützt. Ich nutze es unter niri.

## Installation

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## Einstellungen

Einstellungen → Plugins → SessionEdge

| Einstellung | Standard |
|---|---|
| Kante | Rechts |
| Lage an der Kante / Abstand vom Anfang bzw. Ende | Mitte / 0 px |
| Breite bei eingefahrener Leiste | 8 px |
| Länge der empfindlichen Zone | 220 px |
| Größe der Schaltflächen | 52 px |
| Verzögerung beim Ausfahren / Verzögerung beim Einfahren | 180 / 500 ms |
| Sichtbare Aktionen | alle außer Ruhezustand |

## IPC

```sh
dms ipc call sessionEdge toggle
```

Damit öffnet oder schließt sich die Leiste, zum Beispiel über ein Tastenkürzel in niri:

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## Übersetzungen

Die Einstellungsseite gibt es auf Deutsch, Spanisch, Französisch, Italienisch, Portugiesisch, Russisch, Japanisch und vereinfachtem Chinesisch. Sie folgt der Sprache, die in DMS eingestellt ist. Wenn eine Übersetzung falsch klingt, ist ein Pull-Request willkommen.

## Hinweis

Ich habe dieses Plugin mit Hilfe von Claude (Anthropic) geschrieben und jede Änderung auf meinem eigenen niri-Desktop getestet.

## Lizenz

MIT
