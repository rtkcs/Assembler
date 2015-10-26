#include <stdio.h>

int randint(int low,int high);

int main()
{
    int i;
    int a;
    int b;

    a = 1;
    b = 17;
    printf("Random int between %d and %d: %d\n",a,b,randint(a,b));
    a = 5000;
    b = 100;
    printf("Random int between %d and %d: %d\n",a,b,randint(a,b));
    a = -10;
    b = 10;
    printf("Random int between %d and %d: %d\n",a,b,randint(a,b));
}
