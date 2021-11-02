#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>

int timb=0;;

void RING(){
    printf("RING! \n");
    timb ++;

    if(timb==4)kill(getpid(),SIGKILL);
}

int main(){
    signal(SIGALRM,RING);
    
    alarm(5);
    
    pause();
    
    alarm(3);
    
    pause();

    while(1){
        alarm(1);
        pause();
    }

    return 0;
}