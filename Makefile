.PHONY: all clean

all: clean
	flex scanner.lex
	bison -Wcounterexamples -d parser.ypp
	g++ -std=c++17 -o hw2 *.c *.cpp
clean:
	rm -f lex.yy.c
	rm -f parser.tab.*pp
	rm -f hw2
test:
	sh tests/test.sh

submission:
	zip final_submission/205743230_315479808.zip scanner.lex parser.ypp output.hpp output.cpp
	sh selfcheck-hw2 final_submission/205743230_315479808.zip