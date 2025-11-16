#include <stdio.h>
#include <stdlib.h>

#include "afd.h"

int main(int argc, char *argv[]) {
// ./programa constantes_enteras.txt
// por lo tanto argv[1] tiene constantes_enteras.txt
    FILE *f = fopen(argv[1], "r"); // abro el archivo en argv[1] para lectura("r")

    char palabra[MAX_TOKEN]; // guardara una cant de chars de f para analizar

    procesar_archivo(f, palabra);
    
// aviso que se termino el archivo
    if (feof(f)) {
        printf("\nFin del archivo\n");
    }

    fclose(f); // cierro el archivo al terminar de leer
    return 0;
}