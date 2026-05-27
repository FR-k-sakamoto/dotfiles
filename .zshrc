# PATH設定 (後続のツール読み込みに必要)
export PATH="${HOME}/.local/bin:$PATH"
export PATH="${HOME}/.antigravity/antigravity/bin:$PATH"

# エイリアス
alias ll='ls -laFh'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'

export EDITOR=nvim
export VISUAL=nvim

# docker
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlo='docker logs'
alias dlof='docker logs -f'
alias dst='docker stats'
alias dstop='docker stop'
alias dstart='docker start'
alias drm='docker rm'
alias drmi='docker rmi'
alias dprune='docker system prune'

# docker compose (`dc` は Unix の電卓コマンドと衝突するので `dco` を採用)
alias dco='docker compose'
alias dcup='docker compose up'
alias dcupd='docker compose up -d'
alias dcupb='docker compose up --build'
alias dcdn='docker compose down'
alias dcb='docker compose build'
alias dcps='docker compose ps'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dcr='docker compose run --rm'
alias dcex='docker compose exec'
alias dcrestart='docker compose restart'
alias dcstop='docker compose stop'
alias dcpull='docker compose pull'

# zsh オプション
setopt auto_cd
setopt auto_pushd
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

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(fnm env --use-on-cd)"
