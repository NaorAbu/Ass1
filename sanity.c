#include "types.h"
#include "user.h"
#include "stat.h"

int main(){
   int pid = fork();
   if (pid == 0) {
       sleep(300);
       exit(5);
   }
   else {
       int status;
       wait(&status);
       printf(1, "exit status after is %d\n",status);
   }


    int first_status;
    int second_status;
    int third_status;
    pid = fork(); // the child pid is 99
    if(pid > 0){
        first_status = detach(pid);  // status = 0
        second_status = detach(pid); // status = -1, because this process has already detached this child, and it doesn’t have this child anymore.
        third_status = detach(77);  // status = -1, because this process doesn’t have a child with this pid.
        printf(1, "first: %d, second: %d, third: %d\n", first_status, second_status, third_status);
         }

    exit(0);
    }