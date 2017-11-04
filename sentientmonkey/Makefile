SUBDIRS := $(shell find . -type d -depth 1)

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
