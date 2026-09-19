# SessionEdge : pas à pas

[English](GUIDE.md) · [Deutsch](GUIDE.de.md) · [Español](GUIDE.es.md) · **Français** · [Italiano](GUIDE.it.md) · [Português](GUIDE.pt.md) · [Русский](GUIDE.ru.md) · [日本語](GUIDE.ja.md) · [简体中文](GUIDE.zh_CN.md)

## 1. Installer le plugin

Clonez le dépôt dans votre dossier de plugins DMS :

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. L’activer

Ouvrez Paramètres → Plugins. SessionEdge apparaît dans la liste. Activez-le.

![Liste des plugins avec SessionEdge](images/01-plugin-list.png)

S’il n’apparaît pas, cliquez sur « Scanner » sur cette page ou redémarrez le shell avec `dms restart`.

## 3. Choisir un bord

Dépliez SessionEdge dans la liste des plugins pour voir ses réglages. Choisissez le bord où placer la bande et sa position sur ce bord.

![Réglages de SessionEdge](images/02-settings.png)

Quand le cadre DMS est en mode connecté, la bande sort du cadre en glissant. Du côté de votre barre, la zone d’ancrage est la plus large.

## 4. Ouvrir la bande

Placez le pointeur sur le bord choisi et laissez-le un instant. La bande apparaît en glissant.

![La bande sur le bord droit](images/03-strip.png)

Seule une courte partie du bord réagit (220 px par défaut), la bande ne s’ouvre donc pas quand le pointeur ne fait que passer. Ajustez « Longueur de la zone sensible » et « Délai d’ouverture » si elle s’ouvre trop facilement ou trop tard.

## 5. Utiliser une action

Verrouiller et « Redémarrer le shell » s’exécutent d’un clic. Mettre en veille, hiberner, se déconnecter, redémarrer et éteindre demandent un clic maintenu. Le bouton se remplit pendant que vous maintenez.

![Maintien du bouton « Se déconnecter »](images/04-hold.png)

Relâchez avant la fin pour annuler.

## 6. Choisir les boutons

En bas des réglages, désactivez les actions dont vous n’avez pas besoin. Hiberner n’apparaît que si votre système le prend en charge.

## 7. L’ouvrir avec un raccourci clavier (facultatif)

```sh
dms ipc call sessionEdge toggle
```

Dans niri, ajoutez à votre configuration :

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
