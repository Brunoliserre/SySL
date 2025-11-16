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

void cerrarScope(TablaScopes *tabla)
{
    if (!isEmpty(tabla->ambitos))
    {
        Scope *actual = (Scope *)pop(tabla->ambitos);
        printf("<<< Cerrando scope (nivel %d)\n", stackSize(tabla->ambitos));
        destruirScope(actual);
    }
}

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

int agregarSimbolo(TablaScopes *tabla, Simbolo *nuevo)
{
    Scope *actual = scopeActual(tabla);

    // Verificar duplicados en el mismo scope
    for (int i = 0; i < arraySize(actual->simbolos); i++)
    {
        Simbolo *existente = (Simbolo *)findElemArray(actual->simbolos, i);
        if (strcmp(existente->key, nuevo->key) == 0)
        {
            fprintf(stderr, "Error semántico: redeclaración de '%s' en el mismo scope (línea %d).\n",
                    nuevo->key, nuevo->lineaDeclaracion);
            return 0;
        }
    }

    insertElemArray(actual->simbolos, nuevo);
    actual->cantidad++;
    return 1;
}

Simbolo *buscarSimbolo(TablaScopes *tabla, char *key)
{
    node *actual = tabla->ambitos->top;
    while (actual != NULL)
    {
        Scope *scope = (Scope *)actual->value;
        for (int i = 0; i < arraySize(scope->simbolos); i++)
        {
            Simbolo *s = (Simbolo *)findElemArray(scope->simbolos, i);
            if (strcmp(s->key, key) == 0)
            {
                return s;
            }
        }
        actual = actual->next;
    }
    return NULL;
}

Scope *scopeActual(TablaScopes *tabla)
{
    if (isEmpty(tabla->ambitos))
        return NULL;
    return (Scope *)tabla->ambitos->top->value;
}