# 📘 Grupo 03 - K2151
![Estado del proyecto](https://img.shields.io/badge/estado-completado-green)

## 📚 Materia  
**Sintaxis y Semántica de los Lenguajes**

## 🗓️ Año de cursada  
**2025**

## 👨‍🏫 Profesor  
**Adrián Fernando Fiore**

## 👥 Integrantes del grupo  
- **Iván Samokec** (Legajo: 167.434-1)  
- **Nicolás Di Fini** (Legajo: 163.243-7)
- **Sofía Muñoz** (Legajo: 203.888-2)
- **Erik Flores** (Legajo : 213.122-5)
- **Bruno Liserre** (Legajo: 167.110.8)
- **Agustin Martinez** (Legajo: 209.650-0)

## 🏫 Información del curso  
- **Curso:** K2151  
- **Universidad:** Facultad Regional Buenos Aires, Universidad Tecnológica Nacional (UTN)

## ✨ Descripción  
Este repositorio contiene los trabajos grupales realizados para la materia *Sintaxis y Semántica de los Lenguajes* durante el año 2025. Incluye ejercicios prácticos, análisis de gramáticas, implementación de lenguajes y otros materiales relacionados con la cursada.

## 🚧 Estado del proyecto  
**En desarrollo**  
Este repositorio se encuentra en construcción y se irá actualizando a lo largo del cuatrimestre con los trabajos realizados.

## 📝 Preguntas TP1:

### Benchmark:

gcc -o test_stack stackModuleTest.c stackModuleContiguousStatic.c
Tests pasados exitosamente. Tiempo total de ejecucion: 0.000047 segundos

gcc -o test_stack stackModuleTest.c stackModuleLinkedDynamic.c
Tests pasados exitosamente. Tiempo total de ejecucion: 0.000059 segundos

### a. ¿Cuál es la mejor implementación? Justifique.

La implementación enlazada y dinámica generalmente es mejor en términos de flexibilidad, ya que no está limitada por un tamaño máximo fijo como la implementación contigua y estática. Sin embargo, la implementación contigua puede ser más eficiente en términos de acceso y rendimiento cuando el tamaño máximo está bien definido y no se excede.

### b. ¿Qué cambios haría para que no haya precondiciones? 

Verificaría el estado de la pila antes de operar con Push o Pop. 
En caso de la función Push, si la pila está llena (usando isFull), podría implementar bool para retornar false y mostrar un mensaje de error. 
En caso de la función Pop, si la pila está vacía (usando isEmpty), también podría implementar bool y pasarle una variable a la función donde guardar el valor extraído en caso true (sino retornar false y mostrar un mensaje de error). 

### ¿Qué implicancia tiene el cambio?
Hace que el código sea más seguro y fácil de usar, porque ya no dependemos de que el usuario revise si la pila está llena o vacía antes de usar Push o Pop. Las funciones se encargan de eso y avisan si algo salió mal. Como contra, el código puede ser un poquito más largo o complejo, pero vale la pena porque evita errores y lo hace más "claro".

### c. ¿Qué cambios haría en el diseño para que el stack sea genérico, es decir permita elementos de otros tipos que no sean int?
Para que el stack (pila) sea genérico, es decir, que pueda almacenar cualquier tipo de dato (no solo int o el tipo stackItem), hay que modificar su diseño para trabajar con punteros a void (void*). Este enfoque permite almacenar direcciones de cualquier tipo de datos, haciendo que la pila sea verdaderamente genérica.
// Antes
stackItem data[MAX_VAL];
stackItem* siguiente;
// Después
void* data[MAX_VAL];
void** siguiente;

### ¿Qué implicancia tiene el cambio?
El cambio implica mayor flexibilidad, ya que permite almacenar cualquier tipo de dato, pero también mayor complejidad: se pierde el control de tipo en tiempo de compilación, se requiere casteo manual y una cuidadosa gestión de memoria. 
Se debe asegurar de usar correctamente los punteros y liberar la memoria cuando sea necesario.


### d. Proponga un nuevo diseño para que el módulo pase a ser un tipo de dato, es decir, permita a un programa utilizar más de un stack

El diseño que implementamos ya permite utilizar múltiples pilas independientes dentro de un mismo programa, cumpliendo con la idea de que el stack sea un tipo de dato.

Esto se logra porque:

- Cada pila es una estructura `stack_t` que representa su propio estado interno.
- Las funciones del módulo (`push`, `pop`, `isEmpty`, etc.) operan sobre un puntero a esa estructura (`stack_t *pila`), evitando el uso de variables globales.
- La función `createStack()` devuelve una pila nueva e independiente cada vez que se la llama.

Por lo que, con este disenio es posible crear multiples pilas sin interferencia entre ellas:

```c
stack_t *pila1 = createStack();
stack_t *pila2 = createStack();

push(pila1, 10);
push(pila2, 20);

int a = pop(pila1);  // devuelve 10
int b = pop(pila2);  // devuelve 20
```
