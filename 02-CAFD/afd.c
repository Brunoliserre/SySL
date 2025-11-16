#include <stdio.h>
#include <stdlib.h>

#include "afd.h"

int transiciones[7][6] = {
    // 0      1-7      8-9      xX       hex(a-fA-F)   otro
    { Q1,      Q2,      Q2,      ERR,     ERR,       ERR }, // Q0
    { Q5,      Q5,      ERR,     Q3,      ERR,       ERR }, // Q1+
    { Q2,      Q2,      Q2,      ERR,     ERR,       ERR }, // Q2+
    { Q4,      Q4,      Q4,      ERR,     Q4,        ERR }, // Q3
    { Q4,      Q4,      Q4,      ERR,     Q4,        ERR }, // Q4+
    { Q5,      Q5,      ERR,     ERR,     ERR,       ERR }, // Q5+
    { ERR,     ERR,     ERR,     ERR,     ERR,       ERR }  // ERR
};

int estado_final(int estado) {
    return (estado == Q1 || estado == Q2 || estado == Q4 || estado == Q5);
}

int ingreso_caracter(char caracter) {
    if (caracter == '0') return DIGITO_0;
    if (caracter >= '1' && caracter <= '7') return DIGITO_1_7;
    if (caracter == '8' || caracter == '9') return DIGITO_8_9;
    if (caracter == 'x' || caracter == 'X') return Xx;
    if ((caracter >= 'a' && caracter <= 'f') || (caracter >= 'A' && caracter <= 'F')) return LETRA_HEX;
    return INVALIDO;
}

void procesar_archivo(FILE* f, char palabra[]) {
    int estado = Q0;  //arranco automata en el estado q0
    int indicador = 0; //marca el inicio y fin de una palabra
    int caracter;
    //recorro f mientras caracter no sea el char end_of_file
    while ((caracter = getc(f)) != EOF) {
        if (caracter == '\n') {
            // fin de una palabra -> procesar
            palabra[indicador] = '\0'; // fin de la palabra
            printf("Leída: %s\n", palabra);
            printf("%s -> %s\n", palabra, estado_final(estado) ? "Válida" : "Inválida");
            estado = Q0; // reiniciar automata
            indicador = 0; // reiniciar para iniciar una nueva palabra
        } else {
            int ingreso = ingreso_caracter(caracter);
            estado = transiciones[estado][ingreso];
            // guardo ascii para formar la palabra
            palabra[indicador++] = caracter;
        }
    }
    // procesar última palabra si no terminó en coma
    if (indicador > 0) {
        palabra[indicador] = '\0';
        printf("Leída: %s\n", palabra);
        printf("%s -> %s\n", palabra, estado_final(estado) ? "Válida" : "Inválida");
    }
}