#ifndef ARRAYMODULE_H_
#define ARRAYMODULE_H_

#include <stddef.h>

// ========== TIPOS ==========

typedef void* arrItem;

typedef struct {
    arrItem* elem;
    int len;
    int capacidad;
} Array;

// ========== DECLARACIONES DE FUNCIONES ==========

Array* createArray(int capacidad_inicial);
void destroyArray(Array* a);
void redimensionar(Array* a, int nueva_capacidad);
void insertElemArray(Array* a, arrItem valor);
arrItem findElemArray(Array* a, int indice);
int arraySize(Array* a);

#endif