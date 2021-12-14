#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>
#include <semaphore.h>

#define buffer 5

int indiceConsumicion=0;
int indiceProduccion=0;
int v[buffer]; //vector para movernos por los elementos del buffer

sem_t mutex;
sem_t lleno;
sem_t vacio;

void producirDato(int x){
    v[indiceProduccion] = x;
    indiceProduccion = (indiceProduccion+1)%buffer;
    for(int i=0; i<buffer; i++){
        printf("|%d|",v[i]);
    }
    printf("\n");
}

int consumirDato(){
    int y = v[indiceConsumicion];
    v[indiceConsumicion] = '\0';
    indiceConsumicion = (indiceConsumicion+1)%buffer;
     for(int i=0; i<buffer; i++){
        printf("|%d|",v[i]);
    }
    printf("\n");
    return y;
}

void * productor(){
    for(int i=0; i<10; i++){
        sem_wait(&vacio);
        sem_wait(&mutex);
        int numero = rand()%101;
        producirDato(numero);
        printf("Productor, Dato %d, a producir %d \n",i+1,numero);
        sem_post(&mutex);
        sem_post(&lleno);
    }
    pthread_exit(NULL);
}

void * consumidor(){
    for(int i=0; i<10; i++){
        sem_wait(&lleno);
        sem_wait(&mutex);
        int numero = consumirDato();
        printf("Consumidor, Dato %d, a consumir %d \n",i+1,numero);
        sem_post(&mutex); 
        sem_post(&vacio);
    }
    pthread_exit(NULL);
}

int main(){
    srand(time(NULL));
    
    sem_init(&mutex,0,1);
    sem_init(&lleno,0,0);
    sem_init(&vacio,0,buffer);

    pthread_t threadProductor;
    pthread_t threadConsumidor;

    if(pthread_create(&threadProductor,NULL, (void*) productor, NULL)){
        printf("Error al crear el hilo, codigo de error %d \n",errno);
        exit(EXIT_FAILURE);
    }

    if(pthread_create(&threadConsumidor,NULL, (void*) consumidor, NULL)){
        printf("Error al crear el hilo, codigo de error %d \n",errno);
        exit(EXIT_FAILURE);
    }

    if(pthread_join(threadProductor, NULL)){
        printf("Error al esperar el hilo, codigo de error %d \n",errno);
        exit(EXIT_FAILURE);
    }

    if(pthread_join(threadConsumidor, NULL)){
        printf("Error al esperar el hilo, codigo de error %d \n",errno);
        exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}