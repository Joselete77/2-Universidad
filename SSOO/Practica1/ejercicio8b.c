#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

int main(int argc, char const *argv[]){
    if(argc != 2){
        printf("Error al introducir los argumentos \n");
        exit(EXIT_FAILURE);
    }
    pid_t pid = atoi(argv[1]);

    if(pid<0){
        printf("No introduzcas un pid negativo \n");
        exit(EXIT_FAILURE);
    }

    if(kill(pid, SIGUSR1)){
        printf("Error al enviar la señal \n");
        exit(EXIT_FAILURE);
    }

    if(kill(pid, SIGKILL)){
        printf("Error al enviar la señal \n");
        exit(EXIT_FAILURE);
    }
    return 0;
}