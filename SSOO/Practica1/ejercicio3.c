#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char const *argv[]){
    if(argc<3){
        printf("Error al poner los argumentos \n");
        exit(EXIT_FAILURE);
    }
    int status;
    pid_t pid;
    for(int i=0; i<2; i++){
        switch(fork()){
            case -1:
                printf("Error al crear el hijo \n");
                exit(EXIT_FAILURE);

            case 0:
                if(i==0){
                    printf("Soy el hijo %d y voy a abrir la calcualdora \n",getpid());
                    execlp(argv[1],argv[1],NULL);
                }   
                else{
                    printf("Soy el hijo %d y voy a abrir un fichero de texto \n",getpid());
                    execlp(argv[2],argv[3],NULL);
                }
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
        
}