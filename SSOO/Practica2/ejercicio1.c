#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <pthread.h>
#include <time.h>

void *funcion(){
    printf("Hola soy la hebra %lu y voy a sumar dos numeros aleatorios \n",pthread_self());
    float x = 0;
    float y = 0;
    float *total = malloc(sizeof(float));
    x = (float)rand()/(float)(RAND_MAX);
    y = (float)rand()/(float)(RAND_MAX);
    printf("1.Numero = %f, 2.Numero = %f y la suma es = %f \n",x, y, x+y);
    *total = x + y;
    pthread_exit((void*) total);
}


int main(int argc, char const *argv[]){
    if(argc != 2){
        printf("Error al introducir los argumentos \n");
        exit(EXIT_FAILURE);
    }
    int hebras = atoi(argv[1]);
    pthread_t thread[hebras];
    float *suma = 0;
    float maximo=0;
    srand(time(NULL));


    for(int i=0; i<hebras; i++){
        if(pthread_create(&(thread[i]), NULL,(void *) funcion ,NULL)){
            printf("Error al crear la hebra. Codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
    }

    for(int i=0; i<hebras; i++){
        if(pthread_join(thread[i],(void**)&suma)){
            printf("Error al esperar la hebra. Codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
        maximo = maximo + *suma;
    }
    printf("El resultado final de la suma de los numeros aleatorios es %f \n",maximo);
    exit(EXIT_SUCCESS);
}