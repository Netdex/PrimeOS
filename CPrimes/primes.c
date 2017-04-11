#include <stdio.h>
#include <math.h>
#include <unistd.h>

int is_prime(int c){
    int rt = (int) sqrt(c);
    for(int i = 2; i <= rt; i++){
        if(c % i == 0) return 0;
    }
    return 1;
}

int main(){
    int i = 2;
    while(1){
        if(is_prime(i)){
            printf("%d ", i);
            sleep(1);
        }
        ++i;
    }
}
