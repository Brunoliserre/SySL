CC = gcc
CFLAGS = -Wall -Wextra -std=c11

all: programa

programa: main.o afd.o
	$(CC) $(CFLAGS) -o programa main.o afd.o

main.o: main.c afd.h
	$(CC) $(CFLAGS) -c main.c

afd.o: afd.c afd.h
	$(CC) $(CFLAGS) -c afd.c

clean:
	rm -f *.o programa

.PHONY: all clean