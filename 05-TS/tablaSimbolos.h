#ifndef TABLA_SIMBOLOS_H
#define TABLA_SIMBOLOS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stackModule.h"
#include "arrayModule.h"

// ========== TIPOS ==========

typedef enum
{
    VARIABLE,
    TIPO_ENUM,
    FUNCION
} SimboloTipo;

typedef struct
{
    char *key;
    SimboloTipo clase;
    char *tipoDato;
    int lineaDeclaracion;
    int nivelScope;
    int constante;
    int externo;
    int unsg;
    Array *miembros;
    int cantMiembros;
} Simbolo;

typedef struct
{
    Array *simbolos;
    int cantidad;
} Scope;

typedef struct
{
    stack_t *ambitos;
} TablaScopes;

typedef struct
{
    char *nombre;
    int *valor;
    int tieneValor;
} EnumMiembro;

// ========== DECLARACIONES DE FUNCIONES ==========

// Tabla de scopes
TablaScopes *initTS();
void destroyTS(TablaScopes *tabla);

// Scopes
Scope *crearScope();
void destruirScope(Scope *s);
void abrirScope(TablaScopes *tabla);
void cerrarScope(TablaScopes *tabla);
Scope *scopeActual(TablaScopes *tabla);

// Símbolos
Simbolo *crearSimbolo(char *key, SimboloTipo clase, char *tipoDato,
                      int lineaDeclaracion, int nivelScope,
                      int constante, int externo, int unsg);
int agregarSimbolo(TablaScopes *tabla, Simbolo *nuevo);
Simbolo *buscarSimbolo(TablaScopes *tabla, char *key);

#endif