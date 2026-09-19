# SessionEdge: passo dopo passo

[English](GUIDE.md) · [Deutsch](GUIDE.de.md) · [Español](GUIDE.es.md) · [Français](GUIDE.fr.md) · **Italiano** · [Português](GUIDE.pt.md) · [Русский](GUIDE.ru.md) · [日本語](GUIDE.ja.md) · [简体中文](GUIDE.zh_CN.md)

## 1. Installa il plugin

Clona il repository nella cartella dei plugin di DMS:

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. Attivalo

Apri Impostazioni → Plugin. SessionEdge compare nell’elenco. Attivalo.

![Elenco dei plugin con SessionEdge](images/01-plugin-list.png)

Se non compare, fai clic su «Scansiona» in quella pagina oppure riavvia la shell con `dms restart`.

## 3. Scegli un bordo

Espandi SessionEdge nell’elenco dei plugin per vederne le impostazioni. Scegli il bordo su cui deve stare la striscia e la sua posizione lungo quel bordo.

![Impostazioni di SessionEdge](images/02-settings.png)

Con la cornice di DMS in modalità connessa, la striscia scorre fuori dalla cornice. Sul lato della tua barra l’area di aggancio è più ampia.

## 4. Apri la striscia

Porta il puntatore sul bordo scelto e lascialo lì per un attimo. La striscia scorre fuori.

![La striscia sul bordo destro](images/03-strip.png)

Reagisce solo un breve tratto del bordo (220 px di default), così la striscia non si apre quando il puntatore passa soltanto. Regola «Lunghezza della zona sensibile» e «Ritardo di apertura» se si apre troppo facilmente o troppo tardi.

## 5. Usa un’azione

Blocca e «Riavvia la shell» agiscono con un clic. Sospendi, iberna, esci, riavvia e spegni richiedono di fare clic e tenere premuto. Il pulsante si riempie mentre tieni premuto.

![Pulsante «Esci» tenuto premuto](images/04-hold.png)

Rilascia prima per annullare.

## 6. Scegli i pulsanti

In fondo alle impostazioni disattiva le azioni che non ti servono. Iberna compare solo se il sistema lo supporta.

## 7. Aprila con una scorciatoia da tastiera (facoltativo)

```sh
dms ipc call sessionEdge toggle
```

In niri, aggiungi alla configurazione:

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
