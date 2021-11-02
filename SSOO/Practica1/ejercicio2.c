#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(){

    switch(fork()){
        case -1:
            printf("Error al crear el hijo \n");
            exit(EXIT_FAILURE);

        case 0:
            printf(" Soy el hijo y mi id es %d y el de mi padre que no me va a recoger es %d \n",getpid(),getppid());
            exit(EXIT_SUCCESS);

        default:
        printf("Soy el padre %d y no voy a recoger a mi hijo, solo me voy a echar una siesta y me voy \n",getpid());
        sleep(20);      
        exit(EXIT_SUCCESS);  
    }
}