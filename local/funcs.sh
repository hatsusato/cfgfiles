#!/bin/bash

apt-cache-recurse() {
  local -a flags filter
  flags=(pre-depends recommends suggests conflicts breaks replaces enhances)
  filter=(grep -v -e '^ ' -e '^<' -e ':i386$' -e '^Reverse Depends:$')
  apt-cache --recurse ${flags[@]/#/--no-} "$@" | "${filter[@]}" | sort -u
}
