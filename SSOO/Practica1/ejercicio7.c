#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>


void tratarSennal(){
        printf("Recibida la señal \n");
}


int main(){
    int status;
    pid_t pid;
    pid = fork();
    switch(pid){
        case -1:
            printf("Error al crear los procesos \n");
            exit(EXIT_FAILURE);

        case 0:
            signal(SIGUSR1,tratarSennal);
            for(int i=0; i<5; i++){
                pause();
            }
            sleep(1);
            exit(EXIT_SUCCESS);
        
        default:
            for (int i = 0; i<5; i++){
                sleep(1);
                kill(pid, SIGUSR1); 
            }

            sleep(1);
            kill(pid, SIGKILL); 
            sleep(10);
            wait(&status);
            printf("Hijo finalizado con código de salida %d \n", WEXITSTATUS(status));
    }
}