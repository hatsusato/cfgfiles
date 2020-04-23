#!/bin/bash

suffix() {
  local path
  shopt -s nullglob
  for path in "$1".~*~; do
    echo "${path#$1.}"
  done | grep '~[1-9][0-9]*~' | tr -d '~'
  shopt -u nullglob
}
backup() {
  [[ -e $1 ]] || return 0
  max=$(suffix "$1" | sort -g | tail -n1)
  mv -f -v -T "$1" "$1.~$((max+1))~" >&2
}
ensure() {
  local dir=$(dirname "$1")
  mkdir -p "$dir"
}

if [[ ! -f $1 ]]; then
  echo "$0: $1: No such file" >&2
  exit 1
elif [[ ! -f $2 ]]; then
  backup "$2"
  ensure "$2"
  cp -a -f -v -T "$1" "$2" >&2
elif diff -q "$1" "$2" >/dev/null; then
  touch "$2"
else
  cp -a --backup=t -f -v -T "$1" "$2" >&2
fi
