#!/usr/bin/make -f

files := $(shell git ls-files .config)
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
