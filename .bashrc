# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls="lsd"
alias cat="bat"

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
source ~/.local/share/blesh/ble.sh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH:~/.local/bin:~/go/bin
