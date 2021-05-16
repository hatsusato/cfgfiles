#!/bin/bash

set -eu

ensure-dirs() {
  local line conf=$HOME/.config/local/.ensure-dirs
  [[ -f $conf ]] || return 0
  while read -r line; do
    line=$(eval echo "$line")
    mkdir -m700 -p "$line"
  done <"$conf"
}

ensure-dirs
