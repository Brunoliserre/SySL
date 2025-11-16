### testNum.c:
Prueba de Decimales, Octales, Hexadecimales y Reales:

| Resultado: | Conclusiones: test exitoso |
|-------------|-------------|
| Constante entera decimal: 0 | 0 decimal |
| Constante entera decimal: 123 | 123 decimal |
| Constante entera octal: 007 | 007 octal |
| Constante entera octal: 0755 | 0755 octal |
| Constante entera hexadecimal: 0xFF | 0xFF hex |
| Constante entera hexadecimal: 0X1a3 | 0X1a3 hex |
| Constante real: 12.34 | 12.34 real |
| Constante real: 0.5 | 0.5 real |
| Constante real: -3.14 | -3.14 real |
| Constante real: 10.5e10 | 10.5e10 real notacion cientifica |
| Constante real: 2.71E-5 | 2.71E-5 real notacion cientifica |
| Constante real: 0.0 | 0 real |
| Operador: - <br> Constante entera decimal: 2 <br> Identificador: e | -2e reconocimiento por partes correcto, notacion debe tener un numero [0-9] despues de la Ee para ser reconocido como real |
| Constante entera decimal: 5 <br> Error lexico: . | 5. reconocimiento por partes correcto, no es valido como constante entera en c |
| Error lexico: . <br> Constante entera decimal: 5 | .5 reconocimiento por partes correcto, no es valido como constante entera en c |
| Constante real: 1e3 | 1e3 real notacion cientifica |
| Operador: - | Constante entera decimal: 2 | -2 reconocimiento por partes correcto, decimal neg en c = 0 - 2 |
| Constante entera octal: 00 | 0 octal |
| Constante entera hexadecimal: 0x0 | 0 hex |
| Constante entera decimal: 0 <br> Identificador: x | 0x reconocimiento por partes correcto, para ser hex debe tener un num despues de Xx |


### testIdCharStr.c:
Prueba de Identificadores, Caracteres y Cadenas:

| Resultado: | Conclusiones: test exitoso |
|-------------|-------------|
| Constante caracter: 'a' | 'a' caracter |
| Constante caracter: '\n' | '\n' caracter |
| Error lexico: ' <br> Error lexico: \ <br> Identificador: x41 <br> Error lexico: ' | '\x41' reconocimiento por partes correcto. ' y \ no son operadores ni caracteres de puntuacion en c |
| Literal cadena: "hola" | "hola" cadena |
| Literal cadena: "con escape \"comillas\"" | "con escape \"comillas\"" cadena |
| Literal cadena: "linea\nnueva" | "linea\nnueva" cadena |
| Identificador: variable | variable id |
| Identificador: _variable | _variable id |
| Identificador: miVariable123 | miVariable123 id |
| Identificador: x9 | x9 id |
| Identificador: a | a id |


### testResOpBool.c:
Prueba de Palabras Reservadas, Booleanos, Puntuación y Operadores:

| Resultado: | Conclusiones: test exitoso |
|-------------|-------------|
| Palabra reservada (tipo de dato): int | int tipo de dato |
| Palabra reservada (tipo de dato): double | double tipo de dato |
| Palabra reservada (tipo de dato): char | char tipo de dato|
| Palabra reservada (tipo de dato): char* | char* tipo de dato
| Palabra reservada (tipo de dato): unsigned | unsined tipo de dato |
| Palabra reservada (tipo de dato): bool | bool tipo de dato |
| Palabra reservada (tipo de dato): enum | enum tipo de dato |
| Palabra reservada (tipo de dato): void | void tipo de dato |
| Literal bool: true | true valor bool |
| Literal bool: false | false valor bool |
| Literal cadena: "int" | "int" cadena |
| Palabra reservada (tipo de dato): unsigned <br> Palabra reservada (tipo de dato): int | unsigned int 2 tipos de dato |
| Palabra reservada (otro): const <br> Palabra reservada (tipo de dato): int <br> Identificador: x <br> Constante entera decimal: 5 <br> Caracter de puntuacion: ; | const int x 5; reconocimiento por partes correcto |
| Palabra reservada (otro): extern <br> Identificador: funcion <br> Caracter de puntuacion: ( <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: ; | extern funcion(); reconocimiento por partes correcto |
| Palabra reservada (estructura de control): if <br> Caracter de puntuacion: ( <br> Identificador: a <br> Operador: == <br> Identificador: b <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: { | if (a == b) { reconocimiento por partes correcto |
| Identificador: a <br> Operador: += <br> Constante entera decimal: 2 <br> Caracter de puntuacion: ; | a += 2; reconocimiento por partes correcto |
| Caracter de puntuacion: } <br> Palabra reservada (estructura de control): else <br> Caracter de puntuacion: { | } else { reconocimiento por partes correcto |
| Identificador: b <br> Operador: -- <br> Caracter de puntuacion: ; | b--; reconocimiento por partes correcto |
| Caracter de puntuacion: } | reconocimiento correcto |
| Palabra reservada (estructura de control): while <br> Caracter de puntuacion: ( <br> Identificador: a <br> Operador: > <br> Identificador: b <br> Operador: && <br> Identificador: a <br> Operador: < <br> Constante entera decimal: 100 <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: { | while (a > b && a < 100) { reconocimiento por partes correcto |
| Identificador: a <br> Operador: = <br> Identificador: a <br> Operador: - <br> Constante entera decimal: 1 <br> Caracter de puntuacion: ; | a = a - 1; reconocimiento por partes correcto |
| Caracter de puntuacion: } | reconocimiento correcto |
| Palabra reservada (estructura de control): for <br> Caracter de puntuacion: ( <br> Identificador: i <br> Operador: = <br> Constante entera decimal: 0 <br> Caracter de puntuacion: ; <br> Identificador: i <br> Operador: < <br> Constante entera decimal: 10 <br> Caracter de puntuacion: ; <br> Identificador: i <br> Operador: ++ <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: { | for (i=0; i<10; i++) { reconocimiento por partes correcto |
| Identificador: printf <br> Caracter de puntuacion: ( <br> Literal cadena: "Hola" <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: ; | printf("Hola"); reconocimiento por partes correcto |
| Caracter de puntuacion: } | reconocimiento correcto |
| Palabra reservada (estructura de control): return <br> Identificador: a <br> Operador: ? <br> Constante entera decimal: 1 <br> Operador: : <br> Constante entera decimal: 0 <br> Caracter de puntuacion: ; | return a ? 1 : 0; reconocimiento por partes correcto |


### testGral.c:
Prueba Mixta Final:

| Resultado: | Conclusiones: test exitoso |
|-------------|-------------|
| Palabra reservada (tipo de dato): int <br> Identificador: main <br> Caracter de puntuacion: ( <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: { | int main() { reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): int <br> Operador: =
Constante entera decimal: 42 <br> Caracter de puntuacion: ; | int = 42; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): float <br> Identificador: decimal <br> Operador: = <br> Constante real: 3.14 <br> Identificador: f <br> Caracter de puntuacion: ; | float decimal = 3.14f; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): char <br> Identificador: letra <br> Operador: = <br> Constante caracter: 'A' <br> Caracter de puntuacion: ; | char letra = 'A'; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): double <br> Identificador: grande <br> Operador: = <br> Constante real: 1.23e+10 <br> Caracter de puntuacion: ; | double grande = 1.23e+10; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): int <br> Identificador: contador <br> Operador: = <br> Constante entera octal: 0755 <br> Caracter de puntuacion: ; | int contador = 0755; reconocimiento por partes correcto |
| Identificador: hex <br> Error lexico: . <br> Operador: = <br> Constante entera hexadecimal: 0xFF <br> Caracter de puntuacion: ; | hex. = 0xFF; reconocimiento por partes correcto, los identificadores no llevan "." |
| Palabra reservada (tipo de dato): double <br> Identificador: real <br> Operador: = <br> Constante real: 0.001 <br> Caracter de puntuacion: ; | double real = 0.001; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): int <br> Identificador: _variable1 <br> Operador: = <br> Constante entera decimal: 10 <br> Caracter de puntuacion: ; | int _variable1 = 10; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): float <br> Identificador: promedio_final <br> Operador: = <br> Constante real: 8.75 <br> Identificador: f <br> Caracter de puntuacion: ; | float promedio_final = 8.75f; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): bool <br> Identificador: activo <br> Operador: = <br> Literal bool: true <br> Caracter de puntuacion: ; | bool activo = true; reconocimiento por partes correcto |
| Palabra reservada (tipo de dato): int <br> Identificador: i <br> Caracter de puntuacion: ; | int i; reconocimiento por partes correcto |
| Palabra reservada (estructura de control): if <br> Caracter de puntuacion: ( <br> Operador: ! <br> Identificador: numero <br> Operador: >= <br> Identificador: promedioFinal <br> Operador: && <br> Identificador: activo <br> Operador: != <br> Literal bool: false <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: { | if (!numero >= promedioFinal && activo != false) { reconocimiento por partes correcto |
| Identificador: numero <br> Operador: += <br> Constante entera decimal: 1 <br> Caracter de puntuacion: ; | numero += 1; reconocimiento por partes correcto |
| Caracter de puntuacion: } <br> Error lexico: # | }# reconocimiento por partes correcto |
| Palabra reservada (estructura de control): for <br> Caracter de puntuacion: ( <br> Identificador: i <br> Operador: = <br> Constante entera decimal: 0 <br> Caracter de puntuacion: ; <br> Identificador: i <br> Operador: < <br> Constante entera decimal: 10 <br> Caracter de puntuacion: ; <br> Identificador: i <br> Operador: ++ <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: { | for (i = 0; i < 10; i++) { reconocimiento por partes correcto |
| Identificador: printf <br> Caracter de puntuacion: ( <br> Literal cadena: "Iteración %d\n" <br> Caracter de puntuacion: , <br> Identificador: i <br> Caracter de puntuacion: ) <br> Caracter de puntuacion: ; | printf("Iteración %d\n", i); reconocimiento por partes correcto |
| Identificador: i <br> Operador: -= <br> Constante entera decimal: 1 | i -= 1 reconocimiento por partes correcto |
| Caracter de puntuacion: } <br> Error lexico: . | }. reconocimiento por partes correcto |
| Palabra reservada (otro): const <br> Palabra reservada (tipo de dato): char* <br> Identificador: mensaje <br> Operador: = <br> Literal cadena: "Hola mundo" <br> Caracter de puntuacion: ; | const char* mensaje = "Hola mundo"; reconocimiento por partes correcto |
| Palabra reservada (estructura de control): return <br> Constante entera decimal: 0 <br> Caracter de puntuacion: ; | return 0; reconocimiento por partes correcto |
| Caracter de puntuacion: } | reconocimiento correcto |



