#ifndef STACKMODULE_H_
#define STACKMODULE_H_

#include <stddef.h>

typedef void* stackItem;

typedef struct node {
    stackItem value;
    struct node* next;
} node;

typedef struct {
    node* top;
} stack_t;

// Declaraciones
stack_t* createStack();
void destroyStack(stack_t* pila);
int isEmpty(const stack_t* pila);
void push(stack_t* pila, stackItem valor);
stackItem pop(stack_t* pila);
int stackSize(stack_t* pila);

#endif