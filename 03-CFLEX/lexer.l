%option noyywrap
%option yylineno
%option noinput
%option nounput

%{
   #include <stdio.h>
%}


DECIMAL         0|[1-9][0-9]*
OCTAL           0[0-7]+
HEXADECIMAL     0[xX][0-9a-fA-F]+
REAL            ("-")?(([0-9]+"."[0-9]+([Ee]("+"|"-")?[0-9]+)?)|([0-9]+[Ee]("+"|"-")?[0-9]+))
CARACTER        \'(.|\\.)\'
LITERAL_CADENA  \"(.|\\.)*\"
TIPO_DATO       int|double|float|char\*|char|unsigned|bool|enum|void
IF              if
ELSE            else
WHILE           while
FOR             for
RETURN          return  
OTRO            const|extern
IDENTIFICADOR   [a-zA-Z_][a-zA-Z0-9_]*
OPERADOR        "++"|"--"|"+="|"-="|"+"|"-"|"/="|"/"|"=="|"="|"!="|"!"|"&&"|"||"|">="|">"|"<="|"<"|"?"|":"
PUNTUACION      ";"|","|"{"|"}"|"("|")"|"["|"]"


%%


[ \t\n]+             { /* Ignorar espacios en blanco */ }

{DECIMAL}              { printf("Constante entera decimal: %s\n", yytext); }
{OCTAL}                { printf("Constante entera octal: %s\n", yytext); }
{HEXADECIMAL}          { printf("Constante entera hexadecimal: %s\n", yytext); }
{REAL}                 { printf("Constante real: %s\n", yytext); }
{CARACTER}             { printf("Constante caracter: %s\n", yytext); }
{LITERAL_CADENA}       { printf("Literal cadena: %s\n", yytext); }
{TIPO_DATO}            { printf("Palabra reservada (tipo de dato): %s\n", yytext); }
{IF}                   { printf("Palabra reservada (control): %s\n", yytext); }
{ELSE}                 { printf("Palabra reservada (control): %s\n", yytext); }
{WHILE}                { printf("Palabra reservada (control): %s\n", yytext); }
{FOR}                  { printf("Palabra reservada (control): %s\n", yytext); }
{RETURN}               { printf("Palabra reservada (control): %s\n", yytext); }
{OTRO}                 { printf("Palabra reservada (otro): %s\n", yytext); }
{IDENTIFICADOR}        { printf("Identificador: %s\n", yytext); }
{OPERADOR}             { printf("Operador: %s\n", yytext); }
{PUNTUACION}           { printf("Caracter de puntuacion: %s\n", yytext); }

.                      { printf("Error lexico: %s\n", yytext); }


%%


// tomar archivo y analizar lexicamente
int main(int argc, char *argv[]) {
   if (argc < 2) {
      fprintf(stderr, "Uso: %s <archivo.c>\n", argv[0]);
      return 1;
   }

   yyin = fopen(argv[1], "r");


   yylex(); // Flex lee hasta EOF por si mismo


   fclose(yyin);
   return 0;
}

