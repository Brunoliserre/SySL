%{
#include<math.h>
#include<stdio.h>
#include<ctype.h>
#include<string.h>

extern int yylex();
int yyerror(const char*); // para evitar warning "discard qualifier"

extern FILE* yyin;

extern char* yytext; 

int errorCount = 0;

/* Helper para reportar errores */
void report_error(const char *contexto, int linea, const char *mensaje) {
    fprintf(stderr, "Error en %s <línea:%d>: %s\n", 
            contexto ? contexto : "desconocido", 
            linea, 
            mensaje ? mensaje : "error");
    fprintf(stderr, "  Token: '%s'\n", yytext);
    errorCount++;
}
%}

%define parse.error verbose // mensajes de error detallados

%locations // manejo de ubicaciones

%union {
    int ival; // decimal, octal, hex
    double dval; // real
    char cval; // caracter
    char* cadena; // cadena, tipo_dato, identificador
}

%token <ival> ENTERO
%token <dval> NUMERO
%token <cval> CARACTER
%token <cadena> CADENA TIPO_DATO IDENTIFICADOR
%token <cadena> RETURN FOR WHILE ELSE IF
%token <cadena> CONST EXTERN
%token INCREMENTO DECREMENTO MAS_IGUAL MENOS_IGUAL DIV_IGUAL POR_IGUAL
%token IGUALDAD DIFERENTE AND OR MAYOR_IGUAL MENOR_IGUAL

/* Precedencia y asociatividad */
%left OR
%left AND
%left IGUALDAD DIFERENTE
%left '<' '>' MENOR_IGUAL MAYOR_IGUAL
%left '+' '-'
%left '*' '/'
%right '?' ':'
%right '=' MAS_IGUAL MENOS_IGUAL DIV_IGUAL POR_IGUAL
%right '!'

%start input

%%

input
    : declaraciones_opt sentencias_opt
    ;

declaraciones_opt
    : /* vacío */
    | declaraciones_opt declaracion
    ;

declaracion
    : declaVarSimples
    | declaFuncion
    ;

declaVarSimples
    : TIPO_DATO listaVarSimples ';'
    | CONST TIPO_DATO listaVarSimples ';'
    | EXTERN TIPO_DATO listaVarSimples ';'
    | TIPO_DATO listaVarSimples error {
        fprintf(stderr, "  ⚠ Falta ';' al final de la declaración\n");
        yyerrok;
      }
    | TIPO_DATO error ';' {
        fprintf(stderr, "  ⚠ Identificador o lista de variables inválida\n");
        yyerrok;
      }
    ;

listaVarSimples
    : unaVarSimple
    | listaVarSimples ',' unaVarSimple
    ;

unaVarSimple
    : IDENTIFICADOR inicializacion_opt
    ;

inicializacion_opt
    : /* vacío */
    | '=' expresion
    ;

declaFuncion
    : TIPO_DATO IDENTIFICADOR '(' parametros_opt ')' cuerpoFuncion_opt
    | TIPO_DATO IDENTIFICADOR error ')' cuerpoFuncion_opt {
        fprintf(stderr, "  ⚠ Error en la lista de parámetros\n");
        yyerrok;
      }
    | TIPO_DATO IDENTIFICADOR '(' parametros_opt error cuerpoFuncion_opt {
        fprintf(stderr, "  ⚠ Falta ')' después de los parámetros\n");
        yyerrok;
      }
    | error '{' {
        fprintf(stderr, "  ⚠ Declaración de función mal formada\n");
        yyerrok;
      }
    ;

cuerpoFuncion_opt
    : sentCompuesta
    | ';'
    ;

parametros_opt
    : /* vacío */
    | lista_parametros
    ;

lista_parametros
    : parametro
    | lista_parametros ',' parametro
    ;

parametro
    : TIPO_DATO IDENTIFICADOR
    ;

sentencias_opt
    : /* vacío */
    | sentencias_opt sentencia
    ;

sentencia
    : sentCompuesta
        { printf("Se leyó una sentCompuesta <linea:%d>\n", @1.first_line); }
    | sentExpresion
        { printf("Se leyó una sentExpresion <linea:%d>\n", @1.first_line); }
    | sentSeleccion
        { printf("Se leyó una sentSeleccion(if, else) <linea:%d>\n", @1.first_line); }
    | sentIteracion
        { printf("Se leyó una sentIteracion(while, for) <linea:%d>\n", @1.first_line); }
    | sentSalto
        { printf("Se leyó una sentSalto(return) <linea:%d>\n", @1.first_line); }
    ;

sentCompuesta
    : '{' declaraciones_opt sentencias_opt '}'
    | '{' error '}' {
        report_error("en sentCompuesta", @$.first_line, "contenido inválido en bloque");
        yyerrok;
      }
    ;

sentExpresion
    : expresion_opt ';'
    | error ';' {
        report_error("en sentExpresion", @$.first_line, "expresión inválida (recuperado hasta ';')");
        yyerrok;
      }
    ;

sentSeleccion
    : IF '(' expresion ')' sentencia opSent
    | IF error ')' sentencia opSent {
        fprintf(stderr, "  ⚠ Condición inválida en 'if' (falta '(' o expresión malformada)\n");
        yyerrok;
      }
    | IF '(' expresion error sentencia opSent {
        fprintf(stderr, "  ⚠ Falta ')' en la condición del 'if'\n");
        yyerrok;
      }
    ;

opSent
    : /* vacío */
    | ELSE sentencia
    ;

sentIteracion
    : WHILE '(' expresion ')' sentencia
    | FOR '(' expresion_opt ';' expresion_opt ';' expresion_opt ')' sentencia
    | FOR '(' error ';' error ';' error ')' sentencia {
        report_error("en sentIteracion", @$.first_line, "for mal formado (recuperado)");
        yyerrok;
      }
    | WHILE '(' error ')' sentencia {
        report_error("en sentIteracion", @$.first_line, "while mal formado (recuperado)");
        yyerrok;
      }
    ;

sentSalto
    : RETURN expresion_opt ';'
    | RETURN error ';' {
        report_error("en sentSalto", @$.first_line, "return con expresión inválida");
        yyerrok;
      }
    ;

expresion_opt
    : /* vacío */
    | expresion
    ; 

expresion
    : expCondicional
    | expUnaria opAsignacion expresion
    ;

opAsignacion
    : '='
    | MAS_IGUAL
    | MENOS_IGUAL
    | DIV_IGUAL
    | POR_IGUAL
    ;

expCondicional 
    : expOr     //espresion booleana
    | expOr '?' expresion ':' expCondicional
    ;

expOr
    : expAnd
    | expOr OR expAnd
    ;

expAnd
    : expIgualdad
    | expAnd AND expIgualdad
    ;

expIgualdad
    : expRelacional
    | expIgualdad IGUALDAD expRelacional
    | expIgualdad DIFERENTE expRelacional
    ;

expRelacional
    : expAditiva
    | expRelacional MAYOR_IGUAL expAditiva
    | expRelacional '>' expAditiva
    | expRelacional MENOR_IGUAL expAditiva
    | expRelacional '<' expAditiva
    ;

expAditiva
    : expMultiplicativa
    | expAditiva '+' expMultiplicativa
    | expAditiva '-' expMultiplicativa
    ;

expMultiplicativa
    : expUnaria
    | expMultiplicativa '*' expUnaria
    | expMultiplicativa '/' expUnaria
    ;

expUnaria
    : expPostfijo
    | INCREMENTO expUnaria
    | DECREMENTO expUnaria
    | expUnaria INCREMENTO
    | expUnaria DECREMENTO
    | operUnario expUnaria
    ;

operUnario 
    : '-' // sg
    | '!' // not
    ;

expPostfijo
    : expPrimaria
    | expPostfijo '[' expresion_opt ']'
    | expPostfijo '(' listaArgumentos ')'
    ;

listaArgumentos
    : expresion
    | listaArgumentos ',' expresion
    ;

expPrimaria
    : IDENTIFICADOR
    | ENTERO
    | NUMERO
    | CARACTER
    | CADENA
    | '(' expresion_opt ')'
    ;


%%

/* yyerror: se usa cuando Bison no sabe cómo recuperar;
   incrementamos contador y mostramos una sugerencia de sincronización */
int yyerror(const char *mensaje) {
    /* Ubicación precisa del error */
    fprintf(stderr, "Error sintáctico <línea:%d columna:%d-%d>: ",
            yylloc.first_line, 
            yylloc.first_column, 
            yylloc.last_column);

    if (mensaje) {
        fprintf(stderr, "%s\n", mensaje);
    } else {
        fprintf(stderr, "error de análisis\n");
    }

    /* Información del token actual */
    fprintf(stderr, "  Token encontrado: '%s'\n", yytext);
    
    /* Contexto para el usuario */
    fprintf(stderr, "  Revisar paréntesis, punto y coma, o llaves sin cerrar\n");
    
    errorCount++;
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");

    if (!yyin) {
        perror("No se pudo abrir el archivo");
        return 1;
    }

    // Inicializa las ubicaciones antes del análisis
    extern void iniciarUbicaciones();
    iniciarUbicaciones();

    int resultado = yyparse();

    printf("\n");
    printf("===================================================\n");

    if (errorCount == 0 && resultado == 0) {
        printf("✓ ANÁLISIS EXITOSO\n");
        printf("El archivo '%s' es VÁLIDO\n", argv[1]);
    } else {
        printf("✗ ANÁLISIS CON ERRORES\n");
        printf("Archivo: '%s'\n", argv[1]);
        printf("Errores encontrados: %d\n", errorCount);
        printf("Código de retorno: %d\n", resultado);
    }

    printf("===================================================\n\n");

    fclose(yyin);
    return errorCount > 0 ? 1 : 0;
}