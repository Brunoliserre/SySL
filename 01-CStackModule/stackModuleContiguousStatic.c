#include "stackModule.h"
#include <stdio.h>
#include <stdlib.h>

struct stack_t {
    stackItem data[MAX_VAL];
    stackItem* siguiente;  // puntero al siguiente espacio libre en el data
};

stack_t* createStack() {
    stack_t* pila = malloc(sizeof(stack_t)); // reserva memoria para toda la struct
    if (pila != NULL){ // verifico que malloc haya funcionado
        pila->siguiente = pila->data; // inicializa el puntero siguiente para que apunte al inicio del array data
    }
    return pila;
} // devuelve un puntero a la struct completa (direccion donde esta la pila)

void destroyStack(stack_t* pila) {
    free(pila);
} // libera la memoria que reserva malloc

bool isEmpty(const stack_t* pila) {
    return pila->siguiente == pila->data;
} // apunta al prox espacio libre, si es data, esta vacia

bool isFull(const stack_t* pila) {
    return pila->siguiente == pila->data + MAX_VAL;
}

void push(stack_t* pila, stackItem valor) {
    *(pila->siguiente) = valor;  // Insertamos el valor
    pila->siguiente++;  // Movemos el puntero hacia adelante
}

stackItem pop(stack_t* pila) {
    pila->siguiente--;  // Decrementamos el puntero
    return *(pila->siguiente);  // Devolvemos el valor
}
