int *ptr1, *ptr2;
char *mensaje;
int x, y;

void modificar(int *p) {
    *p = 100;
}

int obtener(int *p) {
    int valor;
    valor = *p;
    return valor;
}

int main() {
    int numero;
    int resultado;
    
    numero = 10;
    
    resultado = *ptr1;
    *ptr2 = 20;
    
    *ptr1 = numero;
    numero = *ptr1;
    
    *ptr1 = *ptr2;
    
    x = *ptr1 + 5;
    *ptr2 = x - 3;
    
    if (*ptr1 > 0) {
        *ptr1 = 50;
    }
    
    while (*ptr2 < 10) {
        *ptr2 = *ptr2 + 1;
    }
    
    modificar(ptr1);
    
    resultado = obtener(ptr2);
    
    return 0;
}