%{
#include<math.h>
#include<stdio.h>
#include<ctype.h>
#include<string.h>

extern int yylex(); // Funcion del lexer (FLEX)
int yyerror(const char*); // Funcion de manejo de errores

extern FILE* yyin; // Archivo de entrada para el analizador léxico
extern char* yytext; // Texto del token actual

int errorCount = 0; // Contador de errores encontrados

/* Helper para reportar errores */
void report_error(const char *where, int line, const char *msg) {
    fprintf(stderr, "Error %s <línea:%d>: %s\n", where ? where : "desconocido", line, msg ? msg : "error");
    fprintf(stderr, "Token: '%s'\n", yytext);
    errorCount++;
}
%}

%define parse.error verbose     // Mensajes de error detallados
%locations                      // Manejo de ubicaciones

%union {
    int ival;       // Para ENTERO
    double dval;    // Para NUMERO (real)
    char cval;      // Para CARACTER
    char* cadena;   // Para CADENA, IDENTIFICADOR, etc.
}

%token <ival> ENTERO
%token <dval> NUMERO
%token <cval> CARACTER
%token <cadena> CADENA TIPO_DATO IDENTIFICADOR
%token <cadena> RETURN FOR WHILE ELSE IF
%token <cadena> CONST EXTERN ENUM
%token INCREMENTO DECREMENTO MAS_IGUAL MENOS_IGUAL DIV_IGUAL POR_IGUAL
%token IGUALDAD DIFERENTE AND OR MAYOR_IGUAL MENOR_IGUAL

/* Precedencia y asociatividad */
%left OR
%left AND
%left IGUALDAD DIFERENTE
%left '<' '>' MENOR_IGUAL MAYOR_IGUAL
%left '+' '-'
%left '*' '/'
%right '!' INCREMENTO DECREMENTO 
%right UNARIO  // UNARIO para *, -, !
%right '?' ':' 
%right '=' MAS_IGUAL MENOS_IGUAL DIV_IGUAL POR_IGUAL

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
    | declaEnum
    
    | error ';' {
        report_error("en declaracion", @$.first_line, "Token inesperado a nivel de declaración. Recuperado hasta ';'");
        yyerrok;
        yyclearin;
    }
    ;

declaEnum
    : ENUM IDENTIFICADOR_opt '{' lista_enumeradores '}' IDENTIFICADOR_opt ';' {
        printf("Definición válida de ENUM <línea:%d>\n", @$.first_line);
    }

    | ENUM IDENTIFICADOR_opt error lista_enumeradores '}' IDENTIFICADOR_opt ';' {
        report_error("en declaEnum", @$.first_line, "Falta la llave de apertura '{' después de 'enum' o token inesperado.");
        yyerrok;
        yyclearin; // Recuperamos hasta '{' o un token que nos permita continuar.
    }
    | ENUM IDENTIFICADOR_opt '{' lista_enumeradores error ';' {
        report_error("en declaEnum", @$.first_line, "Error en la lista de enumeradores o falta la llave de cierre '}'. Recuperado hasta ';'.");
        yyerrok;
        yyclearin;
    }
    | ENUM IDENTIFICADOR_opt '{' lista_enumeradores '}' IDENTIFICADOR_opt error {
        report_error("en declaEnum", @$.first_line, "Falta el punto y coma ';' al final de la definición de enum.");
        yyerrok;
        yyclearin;
    }
    ;

IDENTIFICADOR_opt
    : /* vacío */
    | IDENTIFICADOR
    ;

lista_enumeradores
    : IDENTIFICADOR
    | lista_enumeradores ',' IDENTIFICADOR
    | lista_enumeradores error IDENTIFICADOR {
        report_error("en lista_enumeradores", @$.first_line, "Enumeradores separados incorrectamente, se esperaba ','");
        yyerrok;
        yyclearin;
    }
    ;

declaVarSimples
    : TIPO_DATO listaVarSimples ';' {
        printf("Declaración válida de variable(s) <línea:%d>\n", @$.first_line);
    }
    | CONST TIPO_DATO listaVarSimples ';' {
        printf("Declaración válida de variable(s) con CONST <línea:%d>\n", @$.first_line);
    }
    | EXTERN TIPO_DATO listaVarSimples ';' {
        printf("Declaración válida de variable(s) con EXTERN <línea:%d>\n", @$.first_line);
    }

    | TIPO_DATO error ';' {
        report_error("en declaVarSimples", @$.first_line, "Lista de variables o inicialización mal formada. Recuperado hasta ';'");
        yyerrok;
        yyclearin;
    }
    | TIPO_DATO listaVarSimples error {
        report_error("en declaVarSimples", @$.first_line, "Falta ';' al final de la declaración de variables.");
        yyerrok;
        yyclearin;
    }
    ;

listaVarSimples
    : unaVarSimple
    | listaVarSimples ',' unaVarSimple

    | listaVarSimples error unaVarSimple {
        report_error("en listaVarSimples", @$.first_line, "Separación inválida de variables, se esperaba','");
        yyerrok;
        yyclearin; /* descarta el token actual, evita loops de error */
    }
    | listaVarSimples ',' error { 
        report_error("en listaVarSimples", @$.first_line, "Coma de más al final de la lista de variables o variable mal formada.");
        yyerrok;
        yyclearin;
    }
    ;

unaVarSimple
    : declarador inicializacion_opt
    ;

declarador 
    : IDENTIFICADOR
    | '*' IDENTIFICADOR
    ;

inicializacion_opt
    : /* vacío */
    | '=' expresion

    | '=' error { 
        report_error("en inicializacion_opt", @$.first_line, "Expresión inválida después de '=' en inicialización");
        yyerrok;
        yyclearin;
    }
    | error expresion {
        report_error("en inicializacion_opt", @$.first_line, "Falta el operador de asignación '=' en la inicialización.");
        yyerrok;
        yyclearin;
    }
    ;

declaFuncion
    : TIPO_DATO IDENTIFICADOR '(' parametros_opt ')' cuerpoFuncion_opt {
        printf("Declaración válida de función <línea:%d>\n", @$.first_line);
    }

    | TIPO_DATO IDENTIFICADOR '(' error ')' cuerpoFuncion_opt {
        report_error("en declaFuncion", @$.first_line, "declaración de parámetros en función inválida. Recuperado hasta ')'");
        yyerrok;
        yyclearin;
    }
    | TIPO_DATO IDENTIFICADOR error parametros_opt ')' cuerpoFuncion_opt {
        report_error("en declaFuncion", @$.first_line, "Falta el paréntesis de apertura '(' en la firma de función.");
        yyerrok;
        yyclearin;
    }
    | TIPO_DATO IDENTIFICADOR '(' parametros_opt error cuerpoFuncion_opt {
        report_error("en declaFuncion", @$.first_line, "Falta el paréntesis de cierre ')' en la firma de función.");
        yyerrok;
        yyclearin;
    }
    | TIPO_DATO IDENTIFICADOR error '{' {
        report_error("en declaFuncion", @$.first_line, "Firma de función inválida (ej. falta '(' o ')' o ';'). Recuperado hasta '{'");
        yyerrok;
        yyclearin;
    }
    | TIPO_DATO IDENTIFICADOR '(' parametros_opt ')' error {
        report_error("en declaFuncion", @$.first_line, "declaración de función incompleta, agregue ';' o cuerpo de función. Recuperado");
        yyerrok;
        yyclearin;
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
    | lista_parametros error parametro {
        report_error("en lista_parametros", @$.first_line, "Separación inválida de parametros, se esperaba','");
        yyerrok;
        yyclearin; /* descarta el token actual, evita loops de error */
    }
    | lista_parametros ',' error {
        report_error("en lista_parametros", @$.first_line, "Coma de más al final de la lista de parámetros o parámetro mal formado.");
        yyerrok;
        yyclearin;
    }
    ;

parametro
    : const_opt TIPO_DATO IDENTIFICADOR
    | const_opt TIPO_DATO '*' IDENTIFICADOR
    ;

const_opt
    : /* vacío */
    | CONST
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
    
    | error ';' {
        report_error("en sentencia", @$.first_line, "Error en sentencia. Recuperado hasta ';'");
        yyerrok;
        yyclearin;
    }
    ;

sentCompuesta
    : '{' declaraciones_opt sentencias_opt '}'

    | '{' declaraciones_opt sentencias_opt error {
        report_error("en sentCompuesta", @$.first_line, "Falta '}' al final del bloque de sentencias.");
        yyerrok;
        yyclearin;
    }
    | error declaraciones_opt sentencias_opt '}' {
        report_error("en sentCompuesta", @$.first_line, "Falta '{' al inicio del bloque de sentencias.");
        yyerrok;
        yyclearin;
    }
    | '{' error '}' {
        report_error("en bloque", @$.first_line, "Error dentro de bloque. Recuperado hasta '}'");
        yyerrok;
        yyclearin;
    }
    ;

sentExpresion
    : expresion_opt ';'
    | ';'

    | expresion_opt error {
        report_error("en sentExpresion", @$.first_line, "Expresión incompleta, se esperaba ';'");
        yyerrok;
        yyclearin;
    }
    ;

sentSeleccion
    : IF '(' expresion ')' sentencia opSent

    | IF error sentencia opSent {
        report_error("en sentSeleccion", @$.first_line, "Estructura de 'if' incompleta, error en condición. Recuperado.");
        yyerrok;
        yyclearin;
    }
    | IF '(' expresion error sentencia opSent {
        report_error("en sentSeleccion", @$.first_line, "Falta el paréntesis de cierre ')' después de la condición del IF.");
        yyerrok;
        yyclearin;
    }
    | IF error expresion ')' sentencia opSent {
        report_error("en sentSeleccion", @$.first_line, "Falta el paréntesis de apertura '(' en la condición del IF.");
        yyerrok;
        yyclearin;
    }
    // ERROR 26: Falta la sentencia del IF
    | IF '(' expresion ')' error opSent {
        report_error("en sentSeleccion", @$.first_line, "Falta la sentencia después de la condición del IF.");
        yyerrok;
        yyclearin;
    }
    ;

opSent
    : /* vacío */
    | ELSE sentencia

    | ELSE error ';' {
        report_error("en opSent", @$.first_line, "Sentencia de 'else' inválida. Recuperado hasta ';'");
        yyerrok;
        yyclearin;
    }
    ;

sentIteracion
    : WHILE '(' expresion ')' sentencia
    | FOR '(' expresion_opt ';' expresion_opt ';' expresion_opt ')' sentencia

    | WHILE error sentencia {
        report_error("en sentIteracion", @$.first_line, "Estructura de 'while' mal formada (ej. falta '(' o ')'). Recuperado.");
        yyerrok;
        yyclearin;
    }
    | WHILE '(' expresion error sentencia {
        report_error("en sentIteracion", @$.first_line, "Falta el paréntesis de cierre ')' después de la condición del WHILE.");
        yyerrok;
        yyclearin;
    }
    | WHILE error expresion ')' sentencia {
        report_error("en sentIteracion", @$.first_line, "Falta el paréntesis de apertura '(' en la condición del WHILE.");
        yyerrok;
        yyclearin;
    }
    | WHILE '(' expresion ')' error {
        report_error("en sentIteracion", @$.first_line, "Falta la sentencia para el bucle WHILE.");
        yyerrok;
        yyclearin;
    }
    | FOR error sentencia {
        report_error("en sentIteracion", @$.first_line, "Sintaxis de 'for' inválida. Recuperado.");
        yyerrok;
        yyclearin;
    }
    | FOR '(' expresion_opt expresion_opt ';' expresion_opt ')' sentencia {
        report_error("en sentIteracion", @$.first_line, "Sintaxis de 'for' inválida: Falta el primer ';' de separación.");
        yyerrok;
        yyclearin;
    }
    | FOR '(' expresion_opt ';' expresion_opt expresion_opt ')' sentencia {
        report_error("en sentIteracion", @$.first_line, "Sintaxis de 'for' inválida: Falta el segundo ';' de separación.");
        yyerrok;
        yyclearin;
    }
    | FOR '(' expresion_opt ';' expresion_opt ';' expresion_opt error sentencia {
        report_error("en sentIteracion", @$.first_line, "Falta el paréntesis de cierre ')' en la cabecera del FOR.");
        yyerrok;
        yyclearin;
    }
    | FOR '(' expresion_opt ';' expresion_opt ';' expresion_opt ')' error {
        report_error("en sentIteracion", @$.first_line, "Falta la sentencia para el bucle FOR.");
        yyerrok;
        yyclearin;
    }
    ;

sentSalto
    : RETURN expresion_opt ';'

    | RETURN error ';' {
        report_error("en sentSalto", @$.first_line, "Expresión de 'return' inválida. Recuperado hasta ';'");
        yyerrok;
        yyclearin;
    }
    | RETURN expresion_opt error {
        report_error("en sentSalto", @$.first_line, "Falta el ';' al final de la sentencia 'return'.");
        yyerrok;
        yyclearin;
    }
    ;

expresion_opt
    : /* vacío */
    | expresion
    ; 

expresion
    : expCondicional
    | expUnaria opAsignacion expresion

    | expUnaria opAsignacion error {
        report_error("en expresion", @$.first_line, "Expresión inválida después del operador de asignación.");
        yyerrok;
        yyclearin;
    }
    | expUnaria opAsignacion {
        report_error("en expresion", @$.first_line, "Falta la expresión a asignar después del operador.");
        yyerrok;
        yyclearin;
    }
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

    | expOr '?' expresion error {
        report_error("en expCondicional", @$.first_line, "Operador ternario inválido, se esperaba ':'");
        yyerrok;
        yyclearin;
    }
    | expOr error expresion ':' expCondicional {
        report_error("en expCondicional", @$.first_line, "Operador ternario inválido, se esperaba '?'");
        yyerrok;
        yyclearin;
    }
    // ERROR 43: Falta la expresión después del '?'
    | expOr '?' error ':' expCondicional {
        report_error("en expCondicional", @$.first_line, "Falta la expresión después de '?' en el ternario.");
        yyerrok;
        yyclearin;
    }
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
    : operUnario expUnaria %prec UNARIO
    | expPostfijo
    | INCREMENTO expUnaria
    | DECREMENTO expUnaria

    | INCREMENTO error {
        report_error("en expUnaria", @$.first_line, "El operador de incremento '++' requiere un operando válido.");
        yyerrok;
        yyclearin;
    }
    | DECREMENTO error {
        report_error("en expUnaria", @$.first_line, "El operador de decremento '--' requiere un operando válido.");
        yyerrok;
        yyclearin;
    }
    | operUnario error {
        report_error("en expUnaria", @$.first_line, "El operador unario requiere un operando válido.");
        yyerrok;
        yyclearin;
    }
    ;
    
operUnario 
    : '-'   /* signo negativo */
    | '!'   /* NOT lógico */
    | '*'   /* desreferenciación de puntero */
    ;

expPostfijo
    : expPrimaria
    | expPostfijo '[' expresion_opt ']'
    | expPostfijo '(' listaArgumentos ')'
    | expPostfijo INCREMENTO
    | expPostfijo DECREMENTO

    | expPostfijo '[' expresion_opt error {
        report_error("en expPostfijo", @$.first_line, "Falta el corchete de cierre ']' en el acceso al array.");
        yyerrok;
        yyclearin;
    }
    | expPostfijo error expresion_opt ']' {
        report_error("en expPostfijo", @$.first_line, "Falta el corchete de apertura '[' en el acceso al array.");
        yyerrok;
        yyclearin;
    }
    | expPostfijo '(' listaArgumentos error {
        report_error("en expPostfijo", @$.first_line, "Falta el paréntesis de cierre ')' en la llamada a función.");
        yyerrok;
        yyclearin;
    }
    | expPostfijo error listaArgumentos ')' {
        report_error("en expPostfijo", @$.first_line, "Falta el paréntesis de apertura '(' en la llamada a función.");
        yyerrok;
        yyclearin;
    }
    ;

listaArgumentos
    : expresion
    | listaArgumentos ',' expresion

    | listaArgumentos error expresion {
        report_error("en listaArgumentos", @$.first_line, "Argumentos separados incorrectamente, se esperaba ','");
        yyerrok;
        yyclearin;
    }
    | listaArgumentos ',' error {
        report_error("en listaArgumentos", @$.first_line, "Coma de más al final de la lista de argumentos.");
        yyerrok;
        yyclearin;
    }
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
   incrementamos contador y mostramos un msj para el usuario */
int yyerror(const char *mensaje) {
    /* Mensaje de Bison + ubicación */
    fprintf(stderr, "Error sintáctico <línea:%d columna:[%d:%d]>: %s\n",
            yylloc.first_line, yylloc.first_column, yylloc.last_column,
            mensaje ? mensaje : "error");
    errorCount++;

    fprintf(stderr, "Revisar código\n");
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

    if (errorCount == 0 && resultado == 0) {
        printf("El archivo %s es válido\n", argv[1]);
    } else {
        printf("El archivo %s contiene %d errores (yyparse devolvió %d)\n", argv[1], errorCount, resultado);
    }

    fclose(yyin);
    return 0;
}