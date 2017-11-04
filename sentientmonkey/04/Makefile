files = $(shell find . -name '*.tst')
targets = $(patsubst %.tst,%,$(files))

.PHONY: $(targets) all default

default: all

$(targets):
	../../tools/Assembler.sh $@.asm
	../../tools/CPUEmulator.sh $@.tst

%:
	../../tools/Assembler.sh $@.asm
	../../tools/CPUEmulator.sh $@.tst

all: $(targets)
