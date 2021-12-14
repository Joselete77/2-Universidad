#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int par=0;
int impar=0;

void * sumar( void* hilo){
    int *indicelocal = (int*) hilo;
    int *suma = malloc(sizeof(int));

    for(int i=0; i<5; i++){
        int numero = rand()%10;
        *suma += numero;   
    }    
        pthread_mutex_lock(&mutex);
        printf("Valor de la suma en %d es %d\n", *indicelocal, *suma);

        if(*indicelocal%2==0){
            par = par + *suma;
        } 
        else{
            impar = impar + *suma;
        }
        pthread_mutex_unlock(&mutex);

    

    pthread_exit((void*)suma);
}

int main(int argc, char * const argv[]){
    if(argc!=2){
        printf("Error al introucir los argumentos \n");
        exit(EXIT_FAILURE);
    }
    int hilos = atoi(argv[1]);
    srand(time(NULL));
    pthread_t thread[hilos];
    int indice[hilos];
    int *resultado;
    int sumita=0;

    for(int i=0; i<hilos; i++){
        indice[i]=i+1;
        if(pthread_create(&thread[i], NULL, (void *) sumar, (void*) &indice[i])){
            printf("Error al crear el hilo, codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
    }

    for(int i=0; i<hilos; i++){
        if(pthread_join(thread[i], (void**) &resultado)){
            printf("Error al crear el hilo, codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
        sumita = sumita + *resultado;
    }

    printf("Valor de la variable compartida impar: %d \n",impar);

    printf("Valor de la variable compartida par: %d \n",par);


}
