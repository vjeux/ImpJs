
FILES   = $(wildcard src/*.coffee) $(wildcard src/*/*.coffee)
TARGETS = $(FILES:.coffee=.js)

all: $(TARGETS)

%.js: %.coffee
	coffee -c $<
clean:
	rm -f $(TARGETS)

watch:
	coffee -o bin/ -wc src/ &
	coffee -wc demo/

build:
	coffee -j $(TARGETS)
