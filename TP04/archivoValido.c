int x, y = 5, z;
double promedio;
const int LIMITE = 100;
extern char mensaje;

int sumar(int a, int b) {
    int resultado;
    resultado = a + b;
    return resultado;
}

double calcularPromedio(int n) {
    double suma = 0;
    int i;

    for (i = 0; i < n; i = i + 1) {
        suma = suma + i;
    }

    if (n > 0)
        return suma / n;
    else
        return 0;
}

int main() {
    int i;
    double prom;
    i = 10;

    while (i > 0) {
        i = i - 1;
    }

    if (i == 0)
        prom = calcularPromedio(5);
    else
        prom = 0;

    return 0;
}