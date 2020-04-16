set +o ignoreeof
stty stop undef
stty start undef
stty lnext $'\cQ'
command xkbset nullify lock

#export GROFF_NO_SGR=1
export LESS='-M -R -S -x4'
export LESSHISTFILE=/dev/null
export LESSSECURE=1

dir=${XDG_CONFIG_HOME:-$HOME/.config}/local/shell-function
if [[ -d $dir && -r $dir && -x $dir ]]; then
    for sh in "$dir"/*; do
        [[ -f $sh && -r $sh ]] && . "$sh"
    done
fi
unset dir sh

if [ -f ~/.bashrc.private ]; then
  . ~/.bashrc.private
fi
