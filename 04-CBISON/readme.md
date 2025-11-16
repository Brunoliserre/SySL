 ./analizador archivoValido.c
Palabra reservada (tipo de dato): int
Identificador: x
Caracter de puntuacion: ,
Identificador: y
Operador: =
Constante entera decimal: 5
Caracter de puntuacion: ,
Identificador: z
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:1>
Palabra reservada (tipo de dato): double
Identificador: promedio
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:2>
Palabra reservada (otro): const
Palabra reservada (tipo de dato): int
Identificador: LIMITE
Operador: =
Constante entera decimal: 100
Caracter de puntuacion: ;
Declaración válida de variable(s) con CONST <línea:3>
Palabra reservada (otro): extern
Palabra reservada (tipo de dato): char
Identificador: mensaje
Caracter de puntuacion: ;
Declaración válida de variable(s) con EXTERN <línea:4>
Palabra reservada (tipo de dato): int
Identificador: sumar
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Identificador: a
Caracter de puntuacion: ,
Palabra reservada (tipo de dato): int
Identificador: b
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: resultado
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:7>
Identificador: resultado
Operador: =
Identificador: a
Operador: +
Identificador: b
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:8>
Palabra reservada (estructura de control): return
Identificador: resultado
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:9>
Caracter de puntuacion: }
Declaración válida de función <línea:6>
Palabra reservada (tipo de dato): double
Identificador: calcularPromedio
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Identificador: n
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): double
Identificador: suma
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:13>
Palabra reservada (tipo de dato): int
Identificador: i
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:14>
Palabra reservada (estructura de control): for
Caracter de puntuacion: (
Identificador: i
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Identificador: i
Operador: <
Identificador: n
Caracter de puntuacion: ;
Identificador: i
Operador: ++
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: suma
Operador: +=
Identificador: i
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:17>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:16>
Se leyó una sentIteracion(while, for) <linea:16>
Palabra reservada (estructura de control): if
Caracter de puntuacion: (
Identificador: n
Operador: >
Constante entera decimal: 0
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (estructura de control): return
Identificador: suma
Operador: /
Identificador: n
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:21>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:20>
Palabra reservada (estructura de control): return
Se leyó una sentSeleccion(if, else) <linea:20>
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:24>
Caracter de puntuacion: }
Declaración válida de función <línea:12>
Palabra reservada (tipo de dato): int
Identificador: main
Caracter de puntuacion: (
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: i
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:28>
Palabra reservada (tipo de dato): double
Identificador: prom
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:29>
Identificador: i
Operador: =
Constante entera decimal: 10
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:30>
Identificador: sumar
Caracter de puntuacion: (
Constante entera decimal: 5
Caracter de puntuacion: ,
Constante entera decimal: 1
Caracter de puntuacion: )
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:32>
Palabra reservada (estructura de control): while
Caracter de puntuacion: (
Identificador: i
Operador: >
Constante entera decimal: 0
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: i
Operador: =
Identificador: i
Operador: -
Constante entera decimal: 1
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:35>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:34>
Se leyó una sentIteracion(while, for) <linea:34>
Palabra reservada (estructura de control): for
Caracter de puntuacion: (
Identificador: i
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Identificador: i
Operador: <
Constante entera decimal: 10
Caracter de puntuacion: ;
Identificador: i
Operador: =
Identificador: i
Operador: +
Constante entera decimal: 1
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: prom
Operador: =
Identificador: prom
Operador: +
Identificador: i
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:39>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:38>
Se leyó una sentIteracion(while, for) <linea:38>
Palabra reservada (estructura de control): if
Caracter de puntuacion: (
Identificador: i
Operador: ==
Constante entera decimal: 0
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: prom
Operador: =
Identificador: calcularPromedio
Caracter de puntuacion: (
Constante entera decimal: 5
Caracter de puntuacion: )
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:43>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:42>
Palabra reservada (estructura de control): else
Caracter de puntuacion: {
Identificador: prom
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:46>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:45>
Se leyó una sentSeleccion(if, else) <linea:42>
Palabra reservada (estructura de control): return
Identificador: i
Operador: ==
Constante entera decimal: 10
Operador: ?
Constante entera decimal: 1
Operador: :
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:49>
Caracter de puntuacion: }
Declaración válida de función <línea:27>
El archivo archivoValido.c es válido

 ./analizador archivoValido2.c
Palabra reservada (enumerador): enum
Identificador: Color
Caracter de puntuacion: {
Identificador: ROJO
Caracter de puntuacion: ,
Identificador: VERDE
Caracter de puntuacion: ,
Identificador: AZUL
Caracter de puntuacion: }
Caracter de puntuacion: ;
Definición válida de ENUM <línea:1>
Palabra reservada (otro): const
Palabra reservada (tipo de dato): double
Identificador: PI
Operador: =
Constante real: 3.14159
Caracter de puntuacion: ;
Declaración válida de variable(s) con CONST <línea:2>
Palabra reservada (otro): extern
Palabra reservada (tipo de dato): char
Operador: *
Identificador: nombre
Caracter de puntuacion: ;
Declaración válida de variable(s) con EXTERN <línea:3>
Palabra reservada (tipo de dato): int
Identificador: esPar
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Identificador: num
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (estructura de control): if
Caracter de puntuacion: (
Identificador: num
Operador: /
Constante entera decimal: 2
Operador: ==
Constante entera decimal: 0
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (estructura de control): return
Constante entera decimal: 1
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:7>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:6>
Palabra reservada (estructura de control): else
Caracter de puntuacion: {
Palabra reservada (estructura de control): return
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:9>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:8>
Se leyó una sentSeleccion(if, else) <linea:6>
Caracter de puntuacion: }
Declaración válida de función <línea:5>
Palabra reservada (tipo de dato): double
Identificador: factorial
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Identificador: n
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): float
Identificador: resultado
Operador: =
Constante entera decimal: 1
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:14>
Palabra reservada (tipo de dato): int
Identificador: i
Operador: =
Constante entera decimal: 1
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:15>
Palabra reservada (estructura de control): while
Caracter de puntuacion: (
Identificador: i
Operador: <=
Identificador: n
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: resultado
Operador: =
Identificador: resultado
Operador: *
Identificador: i
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:18>
Identificador: i
Operador: ++
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:19>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:17>
Se leyó una sentIteracion(while, for) <linea:17>
Palabra reservada (estructura de control): return
Identificador: resultado
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:22>
Caracter de puntuacion: }
Declaración válida de función <línea:13>
Palabra reservada (tipo de dato): int
Identificador: main
Caracter de puntuacion: (
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: a
Operador: =
Constante entera decimal: 10
Caracter de puntuacion: ,
Identificador: b
Operador: =
Constante entera decimal: 2
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:26>
Palabra reservada (tipo de dato): int
Identificador: res
Caracter de puntuacion: ,
Identificador: i
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:27>
Palabra reservada (tipo de dato): double
Identificador: d
Operador: =
Constante real: 5.0
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:28>
Identificador: res
Operador: =
Identificador: a
Operador: +
Identificador: b
Operador: *
Constante entera decimal: 3
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:30>
Identificador: res
Operador: *=
Constante entera decimal: 2
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:31>
Palabra reservada (estructura de control): if
Caracter de puntuacion: (
Identificador: res
Operador: >
Constante entera decimal: 50
Caracter de puntuacion: )
Identificador: a
Operador: =
Constante entera decimal: 1
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:34>
Palabra reservada (estructura de control): else
Identificador: a
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:36>
Se leyó una sentSeleccion(if, else) <linea:33>
Palabra reservada (estructura de control): for
Caracter de puntuacion: (
Identificador: i
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Identificador: i
Operador: <
Constante entera decimal: 5
Caracter de puntuacion: ;
Identificador: i
Operador: ++
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: res
Operador: +=
Identificador: factorial
Caracter de puntuacion: (
Identificador: i
Caracter de puntuacion: )
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:39>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:38>
Se leyó una sentIteracion(while, for) <linea:38>
Identificador: res
Operador: =
Caracter de puntuacion: (
Identificador: esPar
Caracter de puntuacion: (
Identificador: a
Caracter de puntuacion: )
Operador: ==
Constante entera decimal: 1
Caracter de puntuacion: )
Operador: ?
Identificador: a
Operador: :
Operador: -
Constante entera decimal: 1
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:42>
Identificador: res
Operador: =
Identificador: esPar
Caracter de puntuacion: (
Identificador: a
Operador: +
Identificador: b
Caracter de puntuacion: )
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:44>
Palabra reservada (estructura de control): return
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:46>
Caracter de puntuacion: }
Declaración válida de función <línea:25>
El archivo valido2.c es válido

 ./analizador archivoValido3.c
Palabra reservada (tipo de dato): int
Operador: *
Identificador: ptr1
Caracter de puntuacion: ,
Operador: *
Identificador: ptr2
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:1>
Palabra reservada (tipo de dato): char
Operador: *
Identificador: mensaje
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:2>
Palabra reservada (tipo de dato): int
Identificador: x
Caracter de puntuacion: ,
Identificador: y
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:3>
Palabra reservada (tipo de dato): void
Identificador: modificar
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Operador: *
Identificador: p
Caracter de puntuacion: )
Caracter de puntuacion: {
Operador: *
Identificador: p
Operador: =
Constante entera decimal: 100
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:6>
Caracter de puntuacion: }
Declaración válida de función <línea:5>
Palabra reservada (tipo de dato): int
Identificador: obtener
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Operador: *
Identificador: p
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: valor
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:10>
Identificador: valor
Operador: =
Operador: *
Identificador: p
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:11>
Palabra reservada (estructura de control): return
Identificador: valor
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:12>
Caracter de puntuacion: }
Declaración válida de función <línea:9>
Palabra reservada (tipo de dato): int
Identificador: main
Caracter de puntuacion: (
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: numero
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:16>
Palabra reservada (tipo de dato): int
Identificador: resultado
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:17>
Identificador: numero
Operador: =
Constante entera decimal: 10
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:19>
Identificador: resultado
Operador: =
Operador: *
Identificador: ptr1
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:21>
Operador: *
Identificador: ptr2
Operador: =
Constante entera decimal: 20
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:22>
Operador: *
Identificador: ptr1
Operador: =
Identificador: numero
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:24>
Identificador: numero
Operador: =
Operador: *
Identificador: ptr1
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:25>
Operador: *
Identificador: ptr1
Operador: =
Operador: *
Identificador: ptr2
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:27>
Identificador: x
Operador: =
Operador: *
Identificador: ptr1
Operador: +
Constante entera decimal: 5
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:29>
Operador: *
Identificador: ptr2
Operador: =
Identificador: x
Operador: -
Constante entera decimal: 3
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:30>
Palabra reservada (estructura de control): if
Caracter de puntuacion: (
Operador: *
Identificador: ptr1
Operador: >
Constante entera decimal: 0
Caracter de puntuacion: )
Caracter de puntuacion: {
Operador: *
Identificador: ptr1
Operador: =
Constante entera decimal: 50
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:33>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:32>
Palabra reservada (estructura de control): while
Se leyó una sentSeleccion(if, else) <linea:32>
Caracter de puntuacion: (
Operador: *
Identificador: ptr2
Operador: <
Constante entera decimal: 10
Caracter de puntuacion: )
Caracter de puntuacion: {
Operador: *
Identificador: ptr2
Operador: =
Operador: *
Identificador: ptr2
Operador: +
Constante entera decimal: 1
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:37>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:36>
Se leyó una sentIteracion(while, for) <linea:36>
Identificador: modificar
Caracter de puntuacion: (
Identificador: ptr1
Caracter de puntuacion: )
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:40>
Identificador: resultado
Operador: =
Identificador: obtener
Caracter de puntuacion: (
Identificador: ptr2
Caracter de puntuacion: )
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:42>
Palabra reservada (estructura de control): return
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:44>
Caracter de puntuacion: }
Declaración válida de función <línea:15>
El archivo archivoValido3.c es válido

./analizador archivoInvalido.c
Palabra reservada (tipo de dato): int
Identificador: x
Operador: =
Constante entera decimal: 10
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:1>
Palabra reservada (tipo de dato): double
Identificador: y
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:2>
Palabra reservada (tipo de dato): int
Identificador: sumar
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Identificador: a
Caracter de puntuacion: ,
Palabra reservada (tipo de dato): int
Identificador: b
Caracter de puntuacion: )
Palabra reservada (estructura de control): return
Error sintáctico <línea:5 columna:[4:10]>: syntax error, unexpected RETURN, expecting ';' or '{'
Revisar código
Identificador: a
Operador: +
Identificador: b
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:5>
Caracter de puntuacion: }
Error en sentCompuesta <línea:5>: Falta '{' al inicio del bloque de sentencias.
Token: '}'
Declaración válida de función <línea:4>
Palabra reservada (tipo de dato): void
Identificador: procesar
Caracter de puntuacion: (
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: resultado
Identificador: resultado
Error sintáctico <línea:10 columna:[4:13]>: syntax error, unexpected IDENTIFICADOR, expecting '=' or ';' or ',' or '('
Revisar código
Operador: =
Constante entera decimal: 5
Operador: +
Constante entera decimal: 3
Caracter de puntuacion: ;
Caracter de puntuacion: }
Palabra reservada (tipo de dato): int
Identificador: main
Caracter de puntuacion: (
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: valor
Error en lista_parametros <línea:11>: Separación inválida de parametros, se esperaba','
Token: 'valor'
Operador: =
Error sintáctico <línea:14 columna:[14:15]>: syntax error, unexpected '=', expecting ',' or ')'
Revisar código
Constante entera decimal: 20
Palabra reservada (estructura de control): if
Caracter de puntuacion: (
Identificador: x
Operador: >
Constante entera decimal: 10
Identificador: valor
Operador: =
Constante entera decimal: 100
Caracter de puntuacion: ;
Caracter de puntuacion: }
Palabra reservada (estructura de control): while
Caracter de puntuacion: (
Identificador: y
Operador: <
Constante entera decimal: 5
Caracter de puntuacion: {
Identificador: y
Operador: ++
Caracter de puntuacion: ;
Palabra reservada (estructura de control): for
Caracter de puntuacion: (
Palabra reservada (tipo de dato): int
Identificador: i
Error en lista_parametros <línea:11>: Separación inválida de parametros, se esperaba','
Token: 'i'
Operador: =
Error sintáctico <línea:23 columna:[15:16]>: syntax error, unexpected '=', expecting ',' or ')'
Revisar código
Constante entera decimal: 0
Identificador: i
Operador: <
Constante entera decimal: 10
Caracter de puntuacion: ;
Identificador: i
Operador: ++
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: x
Operador: =
Identificador: x
Operador: +
Constante entera decimal: 1
Caracter de puntuacion: ;
Caracter de puntuacion: }
Identificador: resultado
Operador: =
Caracter de puntuacion: (
Identificador: x
Operador: +
Identificador: y
Operador: *
Constante entera decimal: 2
Caracter de puntuacion: ;
Palabra reservada (tipo de dato): int
Identificador: a
Error en lista_parametros <línea:11>: Separación inválida de parametros, se esperaba','
Token: 'a'
Operador: =
Error sintáctico <línea:29 columna:[10:11]>: syntax error, unexpected '=', expecting ',' or ')'
Revisar código
Constante entera decimal: 5
Caracter de puntuacion: ,
Identificador: b
Caracter de puntuacion: ,
Identificador: c
Operador: =
Caracter de puntuacion: ;
Palabra reservada (estructura de control): return
Identificador: x
Operador: ==
Constante entera decimal: 0
Operador: ?
Constante entera decimal: 1
Operador: :
Caracter de puntuacion: }
El archivo archivoInvalido.c contiene 9 errores (yyparse devolvió 1)

./analizador archivoInvalido2.c
Palabra reservada (tipo de dato): int
Identificador: main
Caracter de puntuacion: (
Caracter de puntuacion: )
Caracter de puntuacion: {
Palabra reservada (tipo de dato): int
Identificador: i
Caracter de puntuacion: ,
Identificador: sum
Error léxico <linea:3 columna:14> Caracter no válido: '@'
Caracter de puntuacion: ;
Declaración válida de variable(s) <línea:3>
Palabra reservada (estructura de control): for
Caracter de puntuacion: (
Identificador: i
Operador: =
Constante entera decimal: 0
Caracter de puntuacion: ;
Identificador: i
Operador: <
Constante entera decimal: 10
Caracter de puntuacion: ;
Identificador: i
Operador: ++
Caracter de puntuacion: )
Caracter de puntuacion: {
Identificador: suma
Operador: +=
Identificador: i
Caracter de puntuacion: ;
Se leyó una sentExpresion <linea:6>
Caracter de puntuacion: }
Se leyó una sentCompuesta <linea:5>
Se leyó una sentIteracion(while, for) <linea:5>
Palabra reservada (estructura de control): return
Constante entera decimal: 0
Caracter de puntuacion: ;
Se leyó una sentSalto(return) <linea:9>
Caracter de puntuacion: }
Declaración válida de función <línea:1>
El archivo archivoInvalido2.c contiene 1 errores (yyparse devolvió 0)
