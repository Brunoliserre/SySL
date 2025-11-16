enum Color { ROJO, VERDE, AZUL };
const double PI = 3.14159;
extern char* nombre;

int esPar(int num) {
    if (num / 2 == 0) {
        return 1;
    } else {
        return 0;
    }
}

double factorial(int n) {
    float resultado = 1;
    int i = 1;

    while (i <= n) {
        resultado = resultado * i;
        i++;
    }

    return resultado;
}

int main() {
    int a = 10, b = 2;
    int res, i;
    double d = 5.0;

    res = a + b * 3;
    res *= 2; 

    if (res > 50)
        a = 1;
    else
        a = 0;

    for (i = 0; i < 5; i++) {
        res += factorial(i);
    }

    res = (esPar(a) == 1) ? a : -1;

    res = esPar(a + b);

    return 0;
}