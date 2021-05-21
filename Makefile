#!/usr/bin/make -f

files := $(shell git ls-files .config)
install/files := $(files:%=install/%)
patch/files := $(wildcard *.patch)
clean/files := $(patch/files:%=clean/%)

.PHONY: all
all:
	@./install.sh $(files)

.PHONY: $(install/files)
$(install/files): install/%: %
	@./install.sh $*

.PHONY: clean $(clean/files)
clean:
	$(RM) $(patch/files)
$(clean/files): clean/%:
	$(RM) $*
