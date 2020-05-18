set +o ignoreeof
if [ -x /usr/bin/stty ]; then
  stty kill undef # unix-line-discard
  stty stop undef
  stty start undef
  stty werase undef # unix-word-rubout
  stty lnext $'\cQ'
fi
if [ -x /usr/bin/xkbset ]; then
  xkbset nullify lock
fi

#export GROFF_NO_SGR=1
export LESS='-M -R -x4'
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export PS1='\[\033[01;31m\]$?\[\033[00m\]'$PS1
