#!/bin/bash

alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias apt-upgrade='sudo apt update && sudo apt upgrade'
alias asciicode='man 7 ascii'
alias caps-to-ctrl='setxkbmap -option ctrl:nocaps'
alias cgrep='grep --color=always'
alias dropbox-conflict='find ~/Dropbox -name "*競合*"'
alias dropbox-resolve='find ~/Dropbox -name "*競合*" -delete'
alias e='spacemacs-client -cn'
alias gocryptfs='gocryptfs -extpass pinentry-askpass'
alias j='jobs'
alias o='xdg-open'
alias private-mount='gocryptfs ~/Dropbox/Private ~/Private'
alias private-umount='fusermount -u ~/Private'
alias reload-aliases='source ~/.bash_aliases'
alias reload-shell='exec $SHELL'
alias s='autossh'
alias swap-reset='sudo swapoff -a && sudo swapon -a'
alias t='tig --all'
alias v='less'
alias wget='wget --show-progress'
alias xev="xev | sed -n 's/^ *\(.*keycode.*\), same_screen.*$/\1/p'"

if [ -f "$HOME"/.config/local/funcs.sh ]; then
  source "$HOME"/.config/local/funcs.sh
  alias apt-depends='apt-cache-recurse depends'
  alias apt-rdepends='apt-cache-recurse rdepends'
  alias p='background evince'
  if [ -x /usr/bin/tput ] && tput setaf 1 &>/dev/null; then
    alias man='man-color'
  fi
fi
