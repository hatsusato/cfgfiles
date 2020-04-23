#!/usr/bin/make -f

dirs := git local
files := $(shell git ls-files $(dirs))
prefix := $(HOME)/.config
target := $(addprefix $(prefix)/,$(files))

.PHONY: all
all: $(target)

$(target): $(prefix)/%: %
	@./deploy.sh $< $@
