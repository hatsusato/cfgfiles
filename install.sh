#!/bin/bash

set -eu

readonly TOP_DIR=${BASH_SOURCE%/*}

backup() {
  local patch=$TOP_DIR/${src##*/}.patch
  local -a diff=(diff -u)
  diff+=(--label "$src")
  diff+=(--label "$src")
  diff+=("$src" "$dst")
  "${diff[@]}" &>/dev/null && return
  "${diff[@]}" >"$patch" || :
}
copy() {
  local -i mode=444
  [[ -x $src ]] && mode=555
  LANG=C install -C -D -m $mode -v -T "$src" "$dst"
}
main() {
  local src dst
  for src; do
    [[ -f $src ]] || continue
    dst=$HOME/$src
    [[ -f $dst ]] && backup
    copy
  done
}

main "$@"
