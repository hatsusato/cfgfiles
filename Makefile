#!/usr/bin/make -f

dirs := fcitx git local xkb
files := $(shell git ls-files $(dirs))
prefix := $(HOME)/.config
target := $(addprefix $(prefix)/,$(files))

.PHONY: all
all: $(target)

$(target): $(prefix)/%: %
	@install -D -m644 -v -T $< $@
