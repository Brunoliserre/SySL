#include "tablaSimbolos.h"

// ========== IMPLEMENTACIONES ==========

// INICIALIZAR TS
TablaScopes *initTS()
{
    TablaScopes *ts = (TablaScopes *)malloc(sizeof(TablaScopes));
    ts->ambitos = createStack(); // Crear pila vacia
    abrirScope(ts);              // Abrir scope global (primer elemento)
    return ts;
}

// Inicializo la tabla de símbolos creando una pila de scopes y agregando
// inmediatamente el scope global, porque todas las variables globales
// necesitan un ámbito desde el inicio del programa.

// LIBERAR TODA LA MEMORIA
void destroyTS(TablaScopes *tabla)
{
    while (!isEmpty(tabla->ambitos))
    {
        Scope *s = (Scope *)pop(tabla->ambitos); // Sacar cada scope
        destruirScope(s);                        // Liberar su contenido
    }
    destroyStack(tabla->ambitos); // Liberar la pila
    free(tabla);                  // Liberar la tabla
}

// Es crítico liberar la memoria en orden inverso a como se reservó:
// primero los elementos más profundos (símbolos),
// luego los contenedores (scopes, pila), y finalmente la estructura principal.
// Esto evita memory leaks.

// CREAR SCOPE VACIO
Scope *crearScope()
{
    Scope *s = (Scope *)malloc(sizeof(Scope));
    s->cantidad = 0;               // Sin sombolos inicialmente
    s->simbolos = createArray(50); // Array con capacidad inicial
    return s;
}

// Cada scope es un contenedor independiente de símbolos.
// Uso un array dinámico porque no sé de antemano cuántas variables se declararán en cada bloque.

// LIBERAR UN SCOPE
void destruirScope(Scope *s)
{
    for (int i = 0; i < arraySize(s->simbolos); i++)
    {
        Simbolo *sym = (Simbolo *)findElemArray(s->simbolos, i);
        if (sym->miembros)
            destroyArray(sym->miembros); // Liberar array de parámetros/enums
        free(sym);                       // Liberar el símbolo
    }
    destroyArray(s->simbolos); // Liberar el array contenedor
    free(s);                   // Liberar el scope
}

// Libero recursivamente cada símbolo y sus subestructuras antes de liberar el contenedor.
// Verifico miembros porque solo funciones y enums tienen esa información adicional.

// ABRIR NUEVO AMBITO
void abrirScope(TablaScopes *tabla)
{
    Scope *nuevo = crearScope(); // Crear scope vacio
    push(tabla->ambitos, nuevo); // Pushearlo a la pila
    printf(">>> Nuevo scope abierto (nivel %d)\n", stackSize(tabla->ambitos));
}

// Usar una pila permite modelar scopes anidados naturalmente: cada nuevo bloque { } pushea un
// scope, y al cerrarlo hago pop. El scope actual siempre está en el tope de la pila.


// CERRAR AMBITO ACTUAL
void cerrarScope(TablaScopes *tabla)
{
    if (!isEmpty(tabla->ambitos))
    {
        Scope *actual = (Scope *)pop(tabla->ambitos);            // Sacar del tope
        printf("<<< Cerrando scope (nivel %d)\n", stackSize(tabla->ambitos));
        destruirScope(actual);          // Liberar todo
    }
}
// Al cerrar un scope, todas las variables declaradas en ese bloque salen del ámbito y deben liberarse. 
// Por eso hago pop de la pila y destruyo el scope completamente


// CREAR SIMBOLO
Simbolo *crearSimbolo(char *key, SimboloTipo clase, char *tipoDato,
                      int lineaDeclaracion, int nivelScope,
                      int constante, int externo, int unsg)
{
    Simbolo *s = (Simbolo *)malloc(sizeof(Simbolo));
    s->key = key;
    s->clase = clase;
    s->tipoDato = tipoDato;
    s->lineaDeclaracion = lineaDeclaracion;
    s->nivelScope = nivelScope;
    s->constante = constante;
    s->externo = externo;
    s->unsg = unsg;
    s->miembros = createArray(50);
    s->cantMiembros = 0;
    return s;
}
// Creo el símbolo con toda su metadata: nombre, tipo, modificadores (const, unsigned, extern) y ubicación. 
// El array miembros se llena después si es función (parámetros) o enum (valores)


// AGREGAR SIMBOLO
int agregarSimbolo(TablaScopes *tabla, Simbolo *nuevo)
{
    Scope *actual = scopeActual(tabla);         // Scope del tope de la pila

    // Verificar duplicados en el mismo scope
    for (int i = 0; i < arraySize(actual->simbolos); i++)
    {
        Simbolo *existente = (Simbolo *)findElemArray(actual->simbolos, i);
        if (strcmp(existente->key, nuevo->key) == 0)
        {
            fprintf(stderr, "Error semántico: redeclaración de '%s' en el mismo scope (línea %d).\n",
                    nuevo->key, nuevo->lineaDeclaracion);
            return 0;   // NO se agregó (error)
        }
    }

    insertElemArray(actual->simbolos, nuevo); // Agregar al array
    actual->cantidad++;
    return 1; // Exito
}
// Solo verifico duplicados en el scope actual porque C permite shadowing: una variable local puede tener el mismo nombre que 
// una global. Lo que no permite es redeclarar en el mismo ámbito.


// BUSCAR EN TODOS LOS SCOPES
Simbolo *buscarSimbolo(TablaScopes *tabla, char *key)
{
    node *actual = tabla->ambitos->top;     // Empezar desde el scope actual
    while (actual != NULL)
    {
        Scope *scope = (Scope *)actual->value;
        for (int i = 0; i < arraySize(scope->simbolos); i++)
        {
            Simbolo *s = (Simbolo *)findElemArray(scope->simbolos, i);
            if (strcmp(s->key, key) == 0)
            {
                return s;       // Encontrado
            }
        }
        actual = actual->next;      // Ir al scope exterior (más viejo)
    }
    return NULL;        // No encontrado en ningún scope
}
// Busco de adentro hacia afuera (scopes más recientes primero) porque en C, las variables locales tienen prioridad sobre las 
// globales (shadowing). Si no la encuentro en ningún scope, es un error semántico.


// OBTENER SCOPE DE TOPE 
Scope *scopeActual(TablaScopes *tabla)
{
    if (isEmpty(tabla->ambitos))
        return NULL;
    return (Scope *)tabla->ambitos->top->value;
}
// El scope actual siempre está en el tope de la pila. Esta función es un helper para evitar acceder directamente a la estructura interna.


// RESUMEN

// initTS()         -> Crear tabla      -> "Inicializo con scope global porque todo programa C tiene ámbito global"
// destroyTS()      -> Liberar todo     -> "Libero en orden inverso para evitar memory leaks"
// abrirScope()     -> Nuevo bloque     -> "Pusheo un scope para cada {, modelando anidamiento"
// cerrarScope()    -> Salir de bloque  -> "Popeo y libero símbolos que salen del ámbito"
// agregarSimbolo() -> Declarar         -> "Solo verifico duplicados en scope actual (C permite shadowing)"
// buscarSimbolo()  -> Usar variable    -> "Busco de adentro hacia afuera (prioridad a locales)"