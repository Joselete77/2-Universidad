#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <pthread.h>

void *cuentaLineas(void *argv){
    printf("Hola soy la hebra %lu y voy a sumar las lineas del fichero \n",pthread_self());

    char const *fname;
    fname = (char *) argv;
    int *lineas = malloc(sizeof(int));
    *lineas = 0;
    char aux[256];

    FILE* f = fopen(fname, "r");
    if(f==NULL){
        printf("Error al abrir el fichero. Codigo de error %d \n",errno);
        exit(EXIT_FAILURE);
    }
    while(fgets(aux, 256, f)!=NULL){
        *lineas += 1;
    }
    fclose(f);
    
    pthread_exit((void*)lineas);
}


int main(int argc, char const *argv[]){
    if(argc<2){
        printf("Error al introducir los argumentos \n");
        exit(EXIT_FAILURE);
    }
    int hebras = (argc-1);
    pthread_t thread[hebras];
    int *totalLinea = 0;
    int sumaTotal = 0;


    for(int i=0; i<hebras;i++){
        if(pthread_create(&thread[i], NULL, (void*) cuentaLineas,(void*) argv[i+1])){
            printf("Error al crear la hebra. Codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
    }

    for(int i=0; i<hebras;i++){
        if(pthread_join(thread[i],(void**)&totalLinea)){
            printf("Error al esperar la hebra. Codigo de error %d \n",errno);
            exit(EXIT_FAILURE);
        }
        sumaTotal = sumaTotal + *totalLinea;
    }

    printf("El numero total de líneas es de %d \n",sumaTotal);

    exit(EXIT_SUCCESS);

}