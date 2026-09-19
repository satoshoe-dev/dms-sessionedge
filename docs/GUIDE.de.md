# SessionEdge: Schritt für Schritt

[English](GUIDE.md) · **Deutsch** · [Español](GUIDE.es.md) · [Français](GUIDE.fr.md) · [Italiano](GUIDE.it.md) · [Português](GUIDE.pt.md) · [Русский](GUIDE.ru.md) · [日本語](GUIDE.ja.md) · [简体中文](GUIDE.zh_CN.md)

## 1. Plugin installieren

Klone das Repository in deinen DMS-Plugin-Ordner:

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. Einschalten

Öffne Einstellungen → Plugins. SessionEdge erscheint in der Liste. Schalte es ein.

![Plugin-Liste mit SessionEdge](images/01-plugin-list.png)

Falls es nicht auftaucht, klicke auf dieser Seite auf „Scannen“ oder starte die Shell mit `dms restart` neu.

## 3. Kante wählen

Klappe SessionEdge in der Plugin-Liste auf, um die Einstellungen zu sehen. Wähle die Kante, an der die Leiste sitzen soll, und ihre Lage an dieser Kante.

![SessionEdge-Einstellungen](images/02-settings.png)

Ist der DMS-Rahmen im verbundenen Modus, fährt die Leiste aus dem Rahmen heraus. Auf der Seite deiner DMS-Leiste ist die Andockfläche am breitesten.

## 4. Leiste öffnen

Bewege den Mauszeiger an die gewählte Kante und lass ihn dort kurz ruhen. Die Leiste fährt aus.

![Die Leiste an der rechten Kante](images/03-strip.png)

Nur ein kurzes Stück der Kante reagiert (standardmäßig 220 px), damit die Leiste beim bloßen Vorbeifahren nicht aufgeht. Passe „Länge der empfindlichen Zone“ und „Verzögerung beim Ausfahren“ an, wenn sie zu leicht oder zu spät öffnet.

## 5. Aktion ausführen

Sperren und „Oberfläche neu starten“ wirken per Klick. Ruhemodus, Ruhezustand, Abmelden, Neustart und Ausschalten brauchen Klicken und Halten. Die Schaltfläche füllt sich, während du hältst.

![Schaltfläche „Abmelden“ wird gehalten](images/04-hold.png)

Lass vorher los, um abzubrechen.

## 6. Schaltflächen auswählen

Schalte unten in den Einstellungen die Aktionen aus, die du nicht brauchst. Ruhezustand erscheint nur, wenn dein System ihn unterstützt.

## 7. Per Tastenkombination öffnen (optional)

```sh
dms ipc call sessionEdge toggle
```

Füge in niri deiner Konfiguration hinzu:

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
