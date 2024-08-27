set -g fish_greeting

alias ls="lsd"
alias cat="bat"
alias s="kitten ssh"


fish_add_path -g ~/.bun/bin ~/.local/bin ~/go/bin ~/.wakatime ~/.rbenv/shims ~/.moon/bin ~/.cargo/bin ~/.fvm_flutter/bin

# Added by `rbenv init` on Tue 27 Aug 15:42:29 CEST 2024
status --is-interactive; and rbenv init - --no-rehash fish | source
