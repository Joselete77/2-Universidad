#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/wait.h>

    void funcion(){
        printf("Mi PID es %d \n",getpid());
    }

int main(){

    signal(SIGUSR1, funcion);
    printf("Mi PID es %d \n",getpid());

    while(1){
        pause();
    }
    return EXIT_SUCCESS;
}