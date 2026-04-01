# dotfiles

## 本プロジェクトの概要

このプロジェクトでは .zsh やその他ツール(WezTerm や NeoVim)の configファイルを管理し、別マシンでも利用できるようにするためのものです。

## 必須ツール (Prerequisites)

この設定を利用するには、以下のツールをインストールしてください。

```bash
# Homebrew (Macの場合)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 必須パッケージのインストール
brew install \
  starship \
  sheldon \
  neovim \
  --cask wezterm \
  --cask font-jetbrains-mono-nerd-font

### Linux / WSL (Ubuntu) の場合

```bash
# starship のインストール
curl -sS https://starship.rs/install.sh | sh

# sheldon のインストール
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

# zsh をデフォルトシェルにする場合
chsh -s $(which zsh)
```

(注意: `~/.local/bin` に実行パスが通っている必要があります)

## セットアップ手順

### 1. dotfiles の取得

```bash
git clone https://github.com/YourUsername/dotfiles.git ~/dotfiles
```

### 2. 設定ファイルの配置 (インストールスクリプト実行)

付属のセットアップスクリプトを実行することで、必要なシンボリックリンクが自動的に作成されます。

```bash
./install.sh
```

## Windows / WSL で利用する場合

Windows上で WezTerm を使用し、自動的に WSL (Ubuntu) を開くための追加設定手順です。

### 1. Windows側での準備
1. [WezTerm](https://wezfurlong.org/wezterm/install/windows.html) を Windows にインストールします。
2. 背景透過やアイコン表示を正しく行うため、Windows側にも [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads) をインストールしてください。
   - **推奨ファイル:** 以下の4つをインストールすれば十分です。
     - `JetBrainsMonoNerdFont-Regular.ttf`
     - `JetBrainsMonoNerdFont-Bold.ttf`
     - `JetBrainsMonoNerdFont-Italic.ttf`
     - `JetBrainsMonoNerdFont-BoldItalic.ttf`
   - **(補足)** `NL` と付いているファイルはリガチャ（`->` が矢印になる機能など）がないバージョンです。記号の結合を楽しみたい場合は `NL` なしを選んでください。

### 2. シンボリックリンクの作成 (Windows側)
Windowsの WezTerm が WSL 内の `wezterm.lua` を参照するように、PowerShell でシンボリックリンクを作成します。

1. PowerShell を **管理者として実行** します。
2. 以下のコマンド（1行）をコピーして実行します：

```powershell
powershell.exe -ExecutionPolicy Bypass -File \\wsl.localhost\Ubuntu\home\k_sakamoto\dotfiles\win_setup.ps1
```

> [!TIP]
> 上記のコマンドのみをコピーしてください（`PS C:\> ` などのプロンプト部分は含めないでください）。

これにより、Windows のホームディレクトリに `.wezterm.lua` が作成され、WSL 内の設定が反映されるようになります。

## 新しい設定を追加する手順
1. `~/dotfiles` 配下に実体ファイルを置く (例: `~/dotfiles/.config/myapp/config`)

2. 元の場所にシンボリックリンクを貼る (`ln -s ~/dotfiles/... ~/.config/myapp/config`)
3. `git add`, `git commit`, `git push` する

## メンテナンス (NeoVim)

### プラグインの削除・クリーンアップ

プラグインを削除した後は、不要なデータをディスクから完全に消去するために以下のコマンドをNeoVim内で実行してください。

1. プラグインの設定ファイル (`lua/plugins/xxx.lua`) を削除または編集
2. NeoVimを再起動
3. コマンドモードで以下を実行

   ```vim
   :Lazy clean
   ```

### プラグインのアップデート

インストール済みのプラグインを一括で最新版に更新するには、以下のコマンドを実行します。

```vim
:Lazy update
```
