#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char const *argv[]){
    if(argc!=2){
        printf("Error al introducir los argumentos \n");
        exit(EXIT_FAILURE);
    }
    int hijos = atoi(argv[1]);
    pid_t pid;
    int status;

    for(int i=0; i<hijos; i++){
        switch(fork()){

            case -1:
                printf("Error al crear los procesos \n");
                exit(EXIT_FAILURE);

            case 0:
                printf("Hola soy el hijo PID %d y mi padre tiene el PID %d \n",getpid(),getppid());
                exit(EXIT_SUCCESS);

            default:
                pid=wait(&status);   
                if(pid>0){
                    if(WIFEXITED(status)) printf("Hijo %d ha salido correctamente con codigo de salida %d \n",pid,WEXITSTATUS(status));
                    if(WIFSIGNALED(status)) printf("Hijo %d ha sido finalizado por la señal %d \n",pid,WTERMSIG(status));
                    if(WIFSTOPPED(status)) printf("Hijo %d ha sido parado por la señal %d \n",pid,WSTOPSIG(status));
                }    

                else{
                    printf("Error al esperar a los hijos \n");
                    exit(EXIT_FAILURE);
                } 
        }
    }
exit(EXIT_SUCCESS);

}