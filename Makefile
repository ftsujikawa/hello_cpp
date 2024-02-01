gcc_options = -std=c++17 -Wall -pedantic-errors

program: main.cpp all.h all.h.gch
	g++ $(gcc_options) -include all.h $< -o $@

all.h.gch: all.h
	g++ $(gcc_options) -x c++-header -o $@ $<

run: program
	./program

clean:
	rm -rf ./program
	rm -rf ./all.h.gch

all: clean program run

.PHONY: run clean
