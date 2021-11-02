#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]){
    if(argc!=2){
        printf("Error al introducir los argumentos \n");
        exit(EXIT_FAILURE);
    }

    int numero = atoi(argv[1]);
    int factorial = 1;

    for(int i=1; i<=numero;i++){
        sleep(1);
        factorial = factorial * i;
        printf("%d \n", fact);
    }
    sleep(1);
    printf("El resultado del factorial de %d es %d \n",numero, factorial);
    return 0;
}