#!/usr/bin/make -f

dirs := fcitx git local systemd xkb
files := $(shell git ls-files $(dirs)) user-dirs.dirs
install/files := $(files:%=install/%)
clean/files := $(shell find . -name '*.bak')

.PHONY: all
all:
	@./install.sh $(files)

.PHONY: $(install/files)
$(install/files): install/%: %
	@./install.sh $*

.PHONY: clean
clean:
	$(RM) $(clean/files)
