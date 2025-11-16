#ifndef AFD_H
#define AFD_H

#define MAX_TOKEN 256

enum Estados { Q0, Q1, Q2, Q3, Q4, Q5, ERR };
enum Ingreso { DIGITO_0, DIGITO_1_7, DIGITO_8_9, Xx, LETRA_HEX, INVALIDO };

extern int transiciones[7][6];

void procesar_archivo(FILE* f, char palabra[]);
int estado_final(int estado);
int ingreso_caracter(char caracter);

#endif