# SessionEdge: passo a passo

[English](GUIDE.md) · [Deutsch](GUIDE.de.md) · [Español](GUIDE.es.md) · [Français](GUIDE.fr.md) · [Italiano](GUIDE.it.md) · **Português** · [Русский](GUIDE.ru.md) · [日本語](GUIDE.ja.md) · [简体中文](GUIDE.zh_CN.md)

## 1. Instale o plugin

Clone o repositório na pasta de plugins do DMS:

```sh
git clone https://github.com/satoshoe-dev/dms-sessionedge ~/.config/DankMaterialShell/plugins/SessionEdge
```

## 2. Ative o plugin

Abra Configurações → Plugins. O SessionEdge aparece na lista. Ative-o.

![Lista de plugins com SessionEdge](images/01-plugin-list.png)

Se ele não aparecer, clique em “Escanear” nessa página ou reinicie o shell com `dms restart`.

## 3. Escolha uma borda

Expanda o SessionEdge na lista de plugins para ver as configurações. Escolha a borda onde a faixa deve ficar e a posição dela nessa borda.

![Configurações do SessionEdge](images/02-settings.png)

Com o frame do DMS no modo conectado, a faixa desliza para fora do frame. No lado da sua barra, a área de encaixe é mais larga.

## 4. Abra a faixa

Leve o ponteiro até a borda escolhida e deixe-o parado ali por um instante. A faixa desliza para fora.

![A faixa na borda direita](images/03-strip.png)

Só um trecho curto da borda reage (220 px por padrão), então a faixa não abre quando o ponteiro apenas passa. Ajuste “Comprimento da zona sensível” e “Atraso ao abrir” se ela abrir fácil demais ou tarde demais.

## 5. Use uma ação

Bloquear e “Reiniciar o shell” funcionam com um clique. Suspender, hibernar, sair, reiniciar e desligar exigem clicar e segurar. O botão vai se preenchendo enquanto você segura.

![Segurando o botão «Sair»](images/04-hold.png)

Solte antes para cancelar.

## 6. Escolha os botões

No fim das configurações, desative as ações de que você não precisa. Hibernar só aparece se o seu sistema suportar.

## 7. Abra com um atalho de teclado (opcional)

```sh
dms ipc call sessionEdge toggle
```

No niri, adicione à sua configuração:

```kdl
binds {
    Mod+Escape { spawn "dms" "ipc" "call" "sessionEdge" "toggle"; }
}
```
