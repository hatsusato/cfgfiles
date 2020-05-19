#!/usr/bin/make -f

dirs := fcitx git local xkb
files := $(shell git ls-files $(dirs)) user-dirs.dirs
prefix := $(HOME)/.config
target := $(addprefix $(prefix)/,$(files))
mode = -m644

.PHONY: all
all: $(target)

$(prefix)/local/.man-init: mode = -m755
$(target): $(prefix)/%: %
	@install -D $(mode) -v -T $< $@
