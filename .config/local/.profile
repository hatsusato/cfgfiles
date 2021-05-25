#!/bin/bash

if command -v mkdir-custom >/dev/null; then
  mkdir-custom -m700 -q /tmp/"$USER"/Downloads || :
  mkdir-custom -m700 -q "$HOME"/Private || :
fi
if command -v ensure-link >/dev/null; then
  ensure-link {"$HOME",/tmp/"$USER"}/Downloads || :
  ensure-link "$HOME"/{,Private/}.password-store || :
  ensure-link "$HOME"/{,Private/}.ssh || :
fi
if command -v xkb-monitor >/dev/null; then
  xkb-monitor || :
fi
