# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

xbindkeys

eval "$(starship init bash)"
source ~/.local/share/blesh/ble.sh
