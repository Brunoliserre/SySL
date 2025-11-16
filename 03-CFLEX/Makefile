CC = gcc
CFLAGS = -Wall -Wextra
LEX = flex

all: lexer

lexer: lex.yy.c
	$(CC) $(CFLAGS) lex.yy.c -o lexer -lfl

lex.yy.c: lexer.l
	$(LEX) lexer.l

clean:
	rm -f lex.yy.c lexer

.PHONY: all clean