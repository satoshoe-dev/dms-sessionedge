# SessionEdge

[English](README.md) · [Deutsch](README.de.md) · [Español](README.es.md) · [Français](README.fr.md) · [Italiano](README.it.md) · **Português** · [Русский](README.ru.md) · [日本語](README.ja.md) · [简体中文](README.zh_CN.md)

Um plugin para o [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) que deixa as ações de sessão em uma barra estreita na borda da tela. Leve o ponteiro até a borda e a barra desliza para fora da moldura. Afaste o ponteiro e a barra volta.

![SessionEdge](assets/screenshot.png)

Passo a passo com imagens: [guia de instalação e configuração](docs/GUIDE.pt.md).

## O que faz

A barra tem Bloquear, Suspender, Hibernar, Sair, Reiniciar, Desligar e Reiniciar o shell. Cada botão pode ser ocultado nas configurações.

É um popout comum do DMS. Com a moldura do DMS no modo conectado, ela sai da moldura e usa o contorno e o fundo dela. Sem a moldura, abre como um popout normal.

Dá para colocar a barra em qualquer borda ou no lado da barra do DMS e alinhar no início, no centro ou no fim dessa borda. Só um trecho curto da borda reage ao ponteiro, e há um pequeno atraso antes de abrir, então ela fica fechada quando o ponteiro só passa por ali.

Suspender, Hibernar, Sair, Reiniciar e Desligar exigem clicar e segurar, com o mesmo tempo do menu de energia do DMS. Bloquear e Reiniciar o shell funcionam com um clique. Todas as ações passam pelos serviços de sessão do DMS, do mesmo jeito que o menu de energia.

## Requisitos

DankMaterialShell 1.6.1 ou mais recente. Deve funcionar em todos os compositores que o DMS suporta. Eu uso no niri.

## Instalação

```sh
git clone https://github.com/21Rebel/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
dms ipc call plugins enable sessionEdge
```

## Configurações

Configurações → Plugins → SessionEdge

| Configuração | Padrão |
|---|---|
| Borda | Direita |
| Posição na borda / Distância do início ou do fim | Centro / 0 px |
| Largura da faixa em repouso | 8 px |
| Comprimento da zona sensível | 220 px |
| Tamanho dos botões | 52 px |
| Atraso ao abrir / Atraso ao fechar | 180 / 500 ms |
| Ações visíveis | todas, menos Hibernar |

## IPC

```sh
dms ipc call sessionEdge toggle
```

Isso abre ou fecha a barra, por exemplo com um atalho de teclado no niri:

```kdl
Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
```

## Traduções

A página de configurações está disponível em alemão, espanhol, francês, italiano, português, russo, japonês e chinês simplificado e segue o idioma definido no DMS. Se alguma tradução soar errada, um pull request é bem-vindo.

## Observação

Escrevi este plugin com ajuda do Claude (Anthropic) e testei cada mudança no meu próprio desktop com niri.

## Licença

MIT
