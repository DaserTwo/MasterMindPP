BUILD ?= build
OUT ?= MasterMindPP

src := $(wildcard src/*.c)
dirs := $(BUILD) $(BUILD)/obj

.PHONY: all
all: $(dirs) $(OUT)

.PHONY: clean
clean:
	$(RM) -vr $(BUILD)
	$(RM) -v $(OUT)

$(dirs):
	mkdir -p $@

$(OUT): $(patsubst src/%.c,$(BUILD)/obj/%.o,$(src))
	$(CC) -o $@ $^

$(patsubst src/%.c,$(BUILD)/obj/%.o,$(src)): $(BUILD)/obj/%.o: src/%.c
	$(CC) -Wall -Wextra -pedantic -c -o $@ $^
