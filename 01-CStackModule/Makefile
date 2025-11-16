# Nombre del ejecutable a crear
EXEC = stackTest

# Archivos fuente 
TEST_SRC = stackModuleTest.c
HEADER = stackModule.h 

# Compilador y flags a utilizar
CC = gcc
CFLAGS = -Wall -Wextra -std=c2x

# Se pueden crear dos implementaciones distintas
CONTIGUOUS_SRC = stackModuleContiguousStatic.c
LINKED_SRC = stackModuleLinkedDynamic.c

# Por defecto compila usando la implementación contigua
all: contiguous

# Compilar con implementación contigua (estática)
contiguous:
	$(CC) $(CFLAGS) $(TEST_SRC) $(CONTIGUOUS_SRC) -o $(EXEC)

# Compilar con implementación enlazada (dinámica)
linked:
	$(CC) $(CFLAGS) $(TEST_SRC) $(LINKED_SRC) -o $(EXEC)


clean:
	rm -f $(EXEC)

.PHONY: all contiguous linked clean
