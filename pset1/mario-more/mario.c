#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int h;
    do
    {
        h = get_int("Height: ");
    }
    while (h < 1);
    for (int i = 1; i <= h; i++)
    {
        for (int j = h - i; j > 0; j--)
        {
            printf(" ");
        }
        for (int m = i; m > 0; m--)
        {
            printf("#");
        }
        printf("  ");
        for (int n = i; n > 0; n--)
        {
            printf("#");
        }
        printf("\n");
    }

}
