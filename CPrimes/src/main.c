#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include "vga.h"
#include "digits.h"
#include "util.h"

int is_prime(int c){
    int rt = (int) sqrt(c);
    for(int i = 2; i <= rt; i++){
        if(c % i == 0) return 0;
    }
    return 1;
}

void draw_number(int n){
	int nlen = (int)(ceil(log(n)/log(10)));
	if(nlen < 1) nlen = 1;
	int maxscal = min((VGA_WIDTH / nlen) / (DIGIT_WIDTH + 1), (VGA_HEIGHT / 1) / (DIGIT_HEIGHT));
	int swidth = maxscal * (DIGIT_WIDTH + 1);
	int totalheight = maxscal * DIGIT_HEIGHT;
	int totalwidth = nlen * swidth;
	int xoff = VGA_WIDTH / 2 - totalwidth / 2;
	int yoff = VGA_HEIGHT / 2 - totalheight / 2;
	for(int i = nlen - 1; i >= 0; i--){
		draw_digit(n % 10, xoff + swidth * i, yoff, maxscal, 15);
		n /= 10;
	}
}
int main(){
	vga_init();
	
    int i = 2;
    while(1){
        if(is_prime(i)){
            draw_number(i);
			vga_swap(1);
            delay(100);
        }
        ++i;
    }
	getchar();
}
