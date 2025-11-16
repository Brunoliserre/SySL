#include <assert.h>
#include <stdio.h>
#include <time.h> // Biblioteca para medir el tiempo de procesamiento

#include "stackModule.h"

void testPerformance(){
    stack_t* pila = createStack();
    assert(isEmpty(pila));

    push(pila, 10);
    assert(!isEmpty(pila));

    assert(pop(pila) == 10);
    
    assert(isEmpty(pila));

    destroyStack(pila);
}

int main() {
    clock_t start = clock(); //inicia medicion de tiempo

    testPerformance();
    printf("Tests pasados exitosamente.\n");

    clock_t end = clock();  // Termina medición de tiempo
    double tiempo = (double)(end - start) / CLOCKS_PER_SEC;

    printf("Tiempo total de ejecucion: %f segundos\n", tiempo);

    return 0;
}