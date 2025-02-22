#include <stdio.h>
#include <cs50.h>

int main(void)
{
    long number = get_long("Number: ");
    int count = 0;
    long k = number;
    long i = number;
    if (k == 0)
    {
        count = 1;
    }
    while (k != 0)
    {
        k /= 10;
        count++;
    }

    while (i >= 100)
    {
        i /= 10;
    }

    if (count == 13 || count == 15 || count == 16)
    {
        int sum = 0;
        while (number != 0)
        {
            sum += number % 10;
            number /=10;
            if ((number % 10) * 2 >= 10)
            {
                sum +=  ((number % 10) * 2) / 10 + ((number % 10) * 2) % 10;
            }
            else
            {
                sum += (number % 10) * 2;
            }
            number /=10;
        }
        if (sum % 10 == 0)
        {
            if (count == 15 && (i == 34 || i == 37))
            {
                printf("AMEX\n");
            }
            else if (count == 16 && (i >= 51 && i <= 55))
            {
                printf("MASTERCARD\n");
            }
            else if ((count == 13 || count == 16) && i / 10 == 4)
            {
                printf("VISA\n");
            }
            else
            {
                printf("INVALID\n");
            }
        }
        else
        {
            printf("INVALID\n");
        }
    }
    else
    {
        printf("INVALID\n");
    }
}
