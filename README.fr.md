# SessionEdge

[English](README.md) · [Deutsch](README.de.md) · [Español](README.es.md) · **Français** · [Italiano](README.it.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [日本語](README.ja.md) · [简体中文](README.zh_CN.md)

Un plugin pour [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) qui regroupe les actions de session dans une barre fine sur un bord de l’écran. Quand le pointeur arrive au bord, la barre sort du cadre en glissant. Quand il s’éloigne, la barre rentre.

![SessionEdge](assets/screenshot.png)

Pas à pas avec des images : [guide d'installation et de configuration](docs/GUIDE.fr.md).

## Ce que fait le plugin

La barre contient Verrouiller, Mettre en veille, Hiberner, Se déconnecter, Redémarrer, Éteindre et Redémarrer le shell. Chaque bouton peut être masqué dans les paramètres.

C’est une fenêtre détachable DMS ordinaire. Si le cadre DMS est en mode connecté, elle sort du cadre et reprend son contour et son arrière-plan. Sans le cadre, elle s’ouvre comme une fenêtre détachable normale.

On peut la placer sur n’importe quel bord ou du côté de la barre DMS, et l’aligner au début, au centre ou à la fin de ce bord. Seule une courte partie du bord réagit au pointeur, et il y a un petit délai avant l’ouverture. Elle reste donc fermée quand on ne fait que passer.

Mettre en veille, Hiberner, Se déconnecter, Redémarrer et Éteindre demandent un clic maintenu, avec la même durée de maintien que le menu d’alimentation de DMS. Verrouiller et Redémarrer le shell s’exécutent au clic. Toutes les actions passent par les services de session de DMS, comme le fait le menu d’alimentation.

## Prérequis

DankMaterialShell 1.6.1 ou plus récent. Il devrait fonctionner sur tous les compositeurs pris en charge par DMS. Je l’utilise sous niri.

## Installation

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## Paramètres

Paramètres → Plugins → SessionEdge

| Paramètre | Par défaut |
|---|---|
| Bord | Droite |
| Position sur le bord / Décalage depuis le début ou la fin | Centre / 0 px |
| Largeur de la bande au repos | 8 px |
| Longueur de la zone sensible | 220 px |
| Taille des boutons | 52 px |
| Délai d’ouverture / Délai de fermeture | 180 / 500 ms |
| Actions visibles | toutes sauf Hiberner |

## IPC

```sh
dms ipc call sessionEdge toggle
```

Cela ouvre ou ferme la barre, par exemple depuis un raccourci clavier dans niri :

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## Traductions

La page des paramètres est disponible en allemand, espagnol, français, italien, portugais, russe, japonais et chinois simplifié, et suit la langue choisie dans DMS. Si une traduction sonne faux, une pull request est la bienvenue.

## Remarque

J’ai écrit ce plugin avec l’aide de Claude (Anthropic) et j’ai testé chaque modification sur mon propre bureau niri.

## Licence

MIT
