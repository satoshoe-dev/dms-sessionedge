# SessionEdge

[English](README.md) · [Deutsch](README.de.md) · **Español** · [Français](README.fr.md) · [Italiano](README.it.md) · [Português](README.pt.md) · [Русский](README.ru.md) · [日本語](README.ja.md) · [简体中文](README.zh_CN.md)

Un plugin para [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) que reúne las acciones de sesión en una barra estrecha en un borde de la pantalla. Al llevar el puntero al borde, la barra sale deslizándose del marco. Al apartarlo, la barra vuelve a entrar.

![SessionEdge](assets/screenshot.png)

Paso a paso con imágenes: [guía de instalación y configuración](docs/GUIDE.es.md).

## Qué hace

La barra contiene Bloquear, Suspender, Hibernar, Cerrar sesión, Reiniciar, Apagar y Reiniciar el shell. Cada botón se puede ocultar en los ajustes.

Es un popout normal de DMS. Con el marco de DMS en modo conectado, sale del marco y usa su contorno y su fondo. Sin el marco se abre como un popout normal.

Se puede colocar en cualquier borde o en el lado de la barra de DMS, y alinear al inicio, al centro o al final de ese borde. Solo una parte corta del borde reacciona al puntero y hay un pequeño retraso antes de abrirse, así que se queda cerrada cuando el puntero solo pasa por ahí.

Suspender, Hibernar, Cerrar sesión, Reiniciar y Apagar requieren hacer clic y mantener pulsado, con el mismo tiempo que en el menú de energía de DMS. Bloquear y Reiniciar el shell se ejecutan con un clic. Todas las acciones pasan por los servicios de sesión de DMS, igual que en el menú de energía.

## Requisitos

DankMaterialShell 1.6.1 o posterior. Debería funcionar en todos los compositores que admite DMS. Yo lo uso en niri.

## Instalación

Desde el registro de complementos:

```sh
dms plugins install sessionEdge
dms ipc call plugins enable sessionEdge
```

También aparece en DMS en Ajustes → Complementos → Explorar. Para instalarlo desde el repositorio:

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## Ajustes

Ajustes → Complementos → SessionEdge

| Ajuste | Valor predeterminado |
|---|---|
| Borde | Derecha |
| Posición en el borde / Distancia desde el inicio o el final | Centro / 0 px |
| Ancho de la franja en reposo | 8 px |
| Longitud de la zona sensible | 220 px |
| Tamaño de los botones | 52 px |
| Retraso al abrir / Retraso al cerrar | 180 / 500 ms |
| Acciones visibles | todas menos Hibernar |

## IPC

```sh
dms ipc call sessionEdge toggle
```

Esto abre o cierra la barra, por ejemplo con un atajo de teclado en niri:

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## Traducciones

La página de ajustes está disponible en alemán, español, francés, italiano, portugués, ruso, japonés y chino simplificado, y sigue el idioma configurado en DMS. Si alguna traducción suena mal, un pull request es bienvenido.

## Nota

Escribí este plugin con ayuda de Claude (Anthropic) y probé cada cambio en mi propio escritorio con niri.

## Licencia

MIT
