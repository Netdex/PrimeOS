#include "vga.h"



byte *DVGA = (byte *)0xA0000;          /* this points to video memory. */
byte *VGA;

void vga_set_mode(byte mode)
{
	union REGS regs;

	regs.h.ah = SET_MODE;
	regs.h.al = mode;
	int86(VIDEO_INT, &regs, &regs);
}


void vga_plot(int x,int y,byte color)
{
	VGA[y*VGA_WIDTH+x]=color;
}

void vga_clear(byte color){
	for(int y = 0; y < VGA_HEIGHT; y++){
		for(int x = 0; x < VGA_WIDTH; x++){
			VGA[y * VGA_WIDTH + x]=color;
		}
	}
}

void vga_swap(int clear){
	memcpy(DVGA, VGA, VGA_WIDTH * VGA_HEIGHT);
	if(clear){
		memset(VGA, 0, VGA_WIDTH * VGA_HEIGHT);
	}
}
void vga_init()
{
	if (__djgpp_nearptr_enable() == 0)
	{
		printf("Could get access to first 640K of memory.\n");
		exit(-1);
	}
	VGA = (byte *) malloc(VGA_WIDTH * VGA_HEIGHT);
	
	DVGA += __djgpp_conventional_base;

	vga_set_mode(VGA_256_COLOR_MODE);       /* set the video mode. */

	// __djgpp_nearptr_disable();
	return;
}