# =====================================
# Makefile para analizador C simplificado
# Archivos: parser.y (Bison) y lexer.l (Flex)
# =====================================

# --- Herramientas ---
YACC = bison
LEX  = flex
CC   = gcc

# --- Archivos fuente ---
PARSER = parser.y
LEXER  = lexer.l
TARGET = analizador

# --- Archivos generados ---
YACC_C = parser.tab.c
YACC_H = parser.tab.h
LEX_C  = lex.yy.c

# --- Flags ---
CFLAGS  = -Wall -Wextra -std=c99
LDFLAGS = -lm

# --- Regla principal ---
all: $(TARGET)

# Compilación del ejecutable final
$(TARGET): $(YACC_C) $(LEX_C)
	$(CC) $(CFLAGS) $(YACC_C) $(LEX_C) -o $(TARGET) $(LDFLAGS)

# Generación de archivos de Bison (.tab.c y .tab.h)
$(YACC_C) $(YACC_H): $(PARSER)
	$(YACC) -d -v $(PARSER)

# Generación de archivo de Flex (lex.yy.c)
$(LEX_C): $(LEXER) $(YACC_H)
	$(LEX) $(LEXER)

# Limpieza de archivos generados
clean:
	rm -f $(YACC_C) $(YACC_H) $(LEX_C) lexer.output $(TARGET)

# Limpieza total
distclean: clean
	rm -f *.o

.PHONY: all clean distclean
