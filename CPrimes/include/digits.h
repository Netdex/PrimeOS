#ifndef DIGITS_H_
#define DIGITS_H_

#include "types.h"
#include "vga.h"

#define DIGIT_WIDTH 	3
#define DIGIT_HEIGHT 	5

void draw_digit(int n, int x, int y, int scale, byte color);

#endif