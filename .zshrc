# PATH設定 (後続のツール読み込みに必要)
export PATH="${HOME}/.local/bin:$PATH"
export PATH="${HOME}/.antigravity/antigravity/bin:$PATH"

# エイリアス
alias ll='ls -laFh'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'

# zsh オプション
setopt auto_cd
setopt auto_pushd
setopt correct
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt pushd_ignore_dups
setopt share_history

export HISTFILE=~/.zsh_history
export HISTSIZE=500
export SAVEHIST=500

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# sheldon
eval "$(sheldon source)"

alias google='web_search google'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/k_sakamoto/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
alias obsidian='obsidian.com'

# Turso
export PATH="$PATH:/home/k_sakamoto/.turso"
