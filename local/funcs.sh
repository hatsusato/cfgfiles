#!/bin/bash

apt-cache-recurse() {
  local -a flags filter
  flags=(pre-depends recommends suggests conflicts breaks replaces enhances)
  filter=(grep -v -e '^ ' -e '^<' -e ':i386$' -e '^Reverse Depends:$')
  apt-cache --recurse ${flags[@]/#/--no-} "$@" | "${filter[@]}" | sort -u
}

backgroud() {
  (($#)) || exit
  exec -a "$1" "$@" &>/dev/null &
}

# reset: sgr0 [0m
# bold: bold [1m
# dim: dim [2m
# italic: sitm [3m, ritm [23m
# underline: smul [4m, rmul [24m
# blink: blink [5m
# reverse: rev [7m
# standout: smso [7m, rmso [27m
# invisible: invis [8m
# foreground color: setaf [3?m
# background color: setab [4?m
# foreground bright color: setaf [9?m
# background bright color: setab [10?m
# color: black 0
# color: red 1
# color: green 2
# color: yellow 3
# color: blue 4
# color: magenta 5
# color: cyan 6
# color: white 7
man-color() {
  local mb md me mh mk mr se so ue us
  # Start blinking
  mb=$(tput blink; tput setaf 3)
  # Start bold mode
  md=$(tput bold; tput setaf 4)
  # End all mode like so, us, mb, md, and mr
  me=$(tput sgr0)
  # Start half bright mode
  mh=$(tput dim; tput setaf 2)
  # Dark mode (Characters invisible)
  mk=$(tput invis)
  # Start reverse mode
  mr=$(tput rev)
  # End standout mode
  se=$(tput sgr0)
  # Start standout mode
  so=$(tput smso; tput setaf 5)
  # End underlining
  ue=$(tput sgr0)
  # Start underlining
  us=$(tput smul; tput setaf 6)
  local e env=(env)
  for e in mb md me mh mk mr se so ue us; do
    env+=("LESS_TERMCAP_$e=${!e}")
  done
  "${env[@]}" man "$@"
}
