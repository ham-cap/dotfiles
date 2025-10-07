export DISABLE_SPRING=true
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export EDITOR="nvim"
export ENHANCD_FILTER="fzf --height 40%:fzy"

# direnvのフックを有効化
# eval "$(direnv hook zsh)"

# VimコマンドでNeovimが起動するようにエイリアス設定
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

# ghqで管理しているリポジトリにpecoで移動するエイリアス
alias gl='cd $(ghq list -p | peco)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenvにパスを通す
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# pureを有効化
autoload -U promptinit; promptinit
prompt pure
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# tmux内でCtrl+p/n/b/fが矢印キーとして機能しないため明示的に設定
bindkey -e
bindkey '^D' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^U' backward-kill-line

#init.sh内で使用されるcompdefの初期化
autoload -Uz compinit
compinit

# enhancdの初期化スクリプトを読み込む
if [[ -f "$HOME/src/github.com/babarot/enhancd/init.sh" ]]; then
  source "$HOME/src/github.com/babarot/enhancd/init.sh"
fi
