files = $(shell find . -name '*.tst')
targets = $(patsubst %.tst,%,$(files))

.PHONY: $(targets) all default

default: all

$(targets):
		../tools/HardwareSimulator.sh $@.tst

%:
		../tools/HardwareSimulator.sh $@.tst


all: $(targets)
