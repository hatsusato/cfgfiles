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
if [ -x /usr/bin/xhost ] && ! xhost &>/dev/null; then
  export LANG=C
fi
if [ -x /usr/bin/tput ] && tput setaf 1 &>/dev/null; then
  export PS1='(\[\033[01;31m\]$?\[\033[00m\])'$PS1
else
  export PS1='($?)'$PS1
fi

#export GROFF_NO_SGR=1
export LESS='-M -R -x4'
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export PASSWORD_STORE_GENERATED_LENGTH=32

load-user-functions() {
  local userfunc=$HOME/.local/bin/function
  local nullglob=$(shopt -p nullglob)
  local extglob=$(shopt -p extglob)
  shopt -s nullglob extglob
  if [[ -d $userfunc && -r $userfunc && -x $userfunc ]]; then
    local func
    for func in "$userfunc"/*; do
      [[ $func == *.sh ]] && continue
      [[ -f $func && -r $func ]] && . "$func"
    done
  fi
  $nullglob
  $extglob
} && load-user-functions
