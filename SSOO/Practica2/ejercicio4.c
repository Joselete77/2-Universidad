#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>

int global = 0;

void *sumar(){
    printf("Hola soy la hebra %lu y voy a incrementar 10000 veces la variable global \n", pthread_self());

    for(int i=0; i<10000;i++){
        global++;
    }

    pthread_exit(NULL);
}

int main(){
    pthread_t thread[2];

    printf("El valor inicial de la variable global es %d \n",global);

    for(int i=0; i<2; i++){
        if(pthread_create(&thread[i], NULL, (void*) sumar, NULL)){
            printf("Error al crear la hebra. Codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
    }

    for(int i=0; i<2; i++){
        if(pthread_join(thread[i], NULL)){
            printf("Error al crear la hebra. Codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
    }

    printf("El valor final de la variable global es %d \n",global);
}