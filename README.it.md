# SessionEdge

[English](README.md) · [Deutsch](README.de.md) · [Español](README.es.md) · [Français](README.fr.md) · **Italiano** · [Português](README.pt.md) · [Русский](README.ru.md) · [日本語](README.ja.md) · [简体中文](README.zh_CN.md)

Un plugin per [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) che tiene le azioni di sessione in una barra sottile su un bordo dello schermo. Quando il puntatore arriva al bordo, la barra scorre fuori dalla cornice. Quando il puntatore si allontana, la barra rientra.

![SessionEdge](assets/screenshot.png)

Passo per passo con immagini: [guida all'installazione e alla configurazione](docs/GUIDE.it.md).

## Cosa fa

La barra contiene Blocca, Sospendi, Iberna, Esci, Riavvia, Spegni e Riavvia la shell. Ogni pulsante si può nascondere nelle impostazioni.

È un normale pannello a comparsa di DMS. Con la cornice di DMS in modalità connessa esce dalla cornice e ne usa il contorno e lo sfondo. Senza cornice si apre come un normale pannello a comparsa.

Si può mettere su qualsiasi bordo o sul lato della barra DMS e allineare all’inizio, al centro o alla fine di quel bordo. Solo un breve tratto del bordo reagisce al puntatore e c’è un piccolo ritardo prima dell’apertura, così resta chiusa se il puntatore passa soltanto.

Sospendi, Iberna, Esci, Riavvia e Spegni richiedono di cliccare e tenere premuto, con la stessa durata del menu di alimentazione di DMS. Blocca e Riavvia la shell partono con un clic. Tutte le azioni passano dai servizi di sessione di DMS, come fa il menu di alimentazione.

## Requisiti

DankMaterialShell 1.6.1 o successivo. Dovrebbe funzionare con tutti i compositor supportati da DMS. Io lo uso su niri.

## Installazione

Dal registro dei plugin:

```sh
dms plugins install sessionEdge
dms ipc call plugins enable sessionEdge
```

Si trova anche in DMS in Impostazioni → Plugin → Sfoglia. Per installarlo dal repository:

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## Impostazioni

Impostazioni → Plugin → SessionEdge

| Impostazione | Predefinito |
|---|---|
| Bordo | Destra |
| Posizione sul bordo / Distanza dall’inizio o dalla fine | Centro / 0 px |
| Larghezza della striscia a riposo | 8 px |
| Lunghezza della zona sensibile | 220 px |
| Dimensione dei pulsanti | 52 px |
| Ritardo di apertura / Ritardo di chiusura | 180 / 500 ms |
| Azioni visibili | tutte tranne Iberna |

## IPC

```sh
dms ipc call sessionEdge toggle
```

Apre o chiude la barra, ad esempio da una scorciatoia da tastiera in niri:

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## Traduzioni

La pagina delle impostazioni è disponibile in tedesco, spagnolo, francese, italiano, portoghese, russo, giapponese e cinese semplificato e segue la lingua impostata in DMS. Se una traduzione suona male, una pull request è benvenuta.

## Nota

Ho scritto questo plugin con l’aiuto di Claude (Anthropic) e ho provato ogni modifica sul mio desktop niri.

## Licenza

MIT
