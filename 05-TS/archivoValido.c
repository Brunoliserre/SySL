int x;
float y;
char c;

int a = 5;
float b = 3.14;

const int MAX = 100;
unsigned int contador;
const unsigned int LIMITE = 255;

enum Color {
    ROJO,
    VERDE,
    AZUL
};

enum Tamano {
    PEQUENO = 10,
    MEDIANO = 20,
    GRANDE = 30
};

int suma(int a, int b);

int suma(int a, int b) {
    int resultado;
    resultado = a + b;
    return resultado;
}

void imprimir() {
    int i;
    i = 0;
    
    while (i < 10) {
        i = i + 1;
    }
}

int maximo(int x, int y) {
    if (x > y) {
        return x;
    } else {
        return y;
    }
}

void contar() {
    int i;
    for (i = 0; i < 10; i = i + 1) {
        x = x + 1;
    }
}

int calcular() {
    int res;
    res = (10 + 5) * 2;
    res = res / 3;
    res = res - 1;
    return res;
}