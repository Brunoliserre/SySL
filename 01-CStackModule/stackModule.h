#ifndef STACKMODULE_H_
#define STACKMODULE_H_

#include <stdbool.h>

#define MAX_VAL 4

typedef int stackItem;
typedef struct stack_t stack_t;

stack_t *createStack();

void destroyStack(stack_t *);

void push(stack_t *pila, stackItem valor);

stackItem pop(stack_t *pila);

bool isEmpty(const stack_t *pila);

bool isFull(const stack_t *pila);

#endif