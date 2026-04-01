#!/bin/bash

# 定数定義
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/backup"

echo "開始: dotfiles セットアップ"

# バックアップディレクトリの作成
if [ ! -d "$BACKUP_DIR" ]; then
    echo "作成: バックアップディレクトリ ($BACKUP_DIR)"
    mkdir -p "$BACKUP_DIR"
fi

# .zshrc の処理
echo "処理中: .zshrc"
if [ -f "$HOME/.zshrc" ]; then
    echo "バックアップ: $HOME/.zshrc -> $BACKUP_DIR/"
    cp "$HOME/.zshrc" "$BACKUP_DIR/"
    rm "$HOME/.zshrc"
fi

echo "シンボリックリンク作成: $HOME/.zshrc -> $DOTFILES_DIR/.zshrc"
ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# .config 配下のディレクトリ処理
echo "処理中: .config ディレクトリ"
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

for config_dir in "$DOTFILES_DIR/.config"/*; do
    dir_name=$(basename "$config_dir")
    target_config="$HOME/.config/$dir_name"

    echo "処理中: .config/$dir_name"

    # 既存の設定があればバックアップして削除
    if [ -d "$target_config" ]; then
        echo "バックアップ: $target_config -> $BACKUP_DIR/"
        cp -r "$target_config" "$BACKUP_DIR/"
        rm -rf "$target_config"
    fi

    # シンボリックリンク作成
    echo "シンボリックリンク作成: $target_config -> $config_dir"
    ln -s "$config_dir" "$target_config"
done

# デフォルトシェルを zsh に変更
if [[ "$SHELL" != *"zsh"* ]]; then
    echo "処理中: デフォルトシェルを zsh に変更します"
    if command -v zsh >/dev/null 2>&1; then
        chsh -s "$(which zsh)"
    else
        echo "警告: zsh が見つかりません。インストールしてください。"
    fi
fi

echo "完了: dotfiles セットアップが完了しました。"

# WSL環境の判定とメッセージ表示
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
    echo ""
    echo "----------------------------------------------------------"
    echo "WSL環境が検出されました。"
    echo "Windows側の WezTerm から利用する場合は、以下の設定が必要です："
    echo "1. Windows側に WezTerm と JetBrains Mono Nerd Font をインストール"
    echo "2. WindowsのPowerShell(管理者)で ~/dotfiles/win_setup.ps1 を実行"
    echo "詳細は README.md を確認してください。"
    echo "----------------------------------------------------------"
fi
