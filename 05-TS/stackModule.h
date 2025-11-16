#ifndef STACKMODULE_H_
#define STACKMODULE_H_

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef void* stackItem;

// Declaración anticipada: 'struct node' existe.
typedef struct node node;

// Definición completa usando 'struct node' para auto-referenciar.
struct node {
    stackItem value;
    node* next; // Usa el alias 'node' conocido
};

typedef struct {
    node* top;
} stack_t;

stack_t* createStack() {
    stack_t* pila = malloc(sizeof(stack_t));
    if(!pila) return NULL;
    pila->top = NULL;
    return pila;
}

void destroyStack(stack_t* pila) {
    while (!isEmpty(pila)) {
        pop(pila);
    }
    free(pila);
}

int isEmpty(const stack_t* pila) {
    return pila->top == NULL ? 1 : 0;
}

void push(stack_t* pila, stackItem valor) {
    node* new_node = malloc(sizeof(node));
    new_node->value = valor;
    new_node->next = pila->top;
    pila->top = new_node;
}

stackItem pop(stack_t* pila) {
    if (isEmpty(pila)) return NULL;

    node* aux = pila->top;
    stackItem value = aux->value;
    pila->top = aux->next;
    free(aux);
    return value;
}

int stackSize(stack_t* pila) {
    int i=0;
    node* actual = pila->top;
    while(actual != NULL) {
        actual = actual->next;
        i++;
    }
    return i;
}


#endif