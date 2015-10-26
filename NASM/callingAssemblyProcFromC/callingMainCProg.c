/* The main C program calls the assembly language procedure test1.
 *
 *
 *
*/


#include <stdio.h>

extern int test1(int, int, int);

int main(void){

		int x = 25;
		int y = 70;
		int value;
		
		
		
		value = test1(x, y, 55);
		printf("Result = %d\n", value);
		
		return 0;
}
