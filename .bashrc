# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls="lsd"
alias cat="bat"
alias s="kitten ssh"

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
source ~/.local/share/blesh/ble.sh
complete -cf doas # doas completions

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH:~/.local/bin:~/go/bin:~/.wakatime
. "$HOME/.cargo/env"

# rbenv
export PATH="/home/hyro/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
