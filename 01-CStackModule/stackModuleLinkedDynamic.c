#include "stackModule.h"
#include <stdio.h>
#include <stdlib.h>

// Cada nodo puede estar en cualquier parte del heap
// Crece segun necesida (no se reserva malloc de todo el array)
struct node {
    stackItem value;
    struct node* next; // puntero al sig nodo
};

struct stack_t {
    struct node* top; // puntero al nodo de tope
};

stack_t* createStack() {
    stack_t* pila = malloc(sizeof(stack_t));
    if(!pila) return NULL;
    pila->top = NULL; //apunta a NULL y no basura xq puede haber errores 
    return pila;
}

// No alcanza con free(pila) xq cada nodo fue creado con mallocs diferentes
// Hay que ir popeando 1 x 1 (cada pop hace free) hasta que luego pueda liberar el espacio del strcut
void destroyStack(stack_t* pila) {
    while (!isEmpty(pila)) {
        pop(pila);
    }
    free(pila);
}

// SI la pila apunta a mi top (unico puntero del struct) esta vacia
bool isEmpty(const stack_t* pila) {
    return pila->top == NULL;
}

bool isFull(const stack_t* pila) {
    return false;  // Siempre falso, ya que la memoria es dinámica
}

// Como es de tamano dinamico, un malloc por cada push
void push(stack_t* pila, stackItem valor) {
    struct node* new_node = malloc(sizeof(struct node));
    new_node->value = valor;
    new_node->next = pila->top;
    pila->top = new_node;
}

stackItem pop(stack_t* pila) {
    // No es necesario verificar si la pila está vacía, ya que la función sera utilizada segun la precondicion
    //if (isEmpty(pila)) {
    //    printf("Stack underflow\n");
    //    return -1;  // Error
    //}
    struct node* aux = pila->top;
    stackItem value = aux->value;
    pila->top = aux->next;
    free(aux);
    return value;
}