#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool only_digits(string s);

int rotate(char character, int n);

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    if (!only_digits(argv[1]))
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    int n = atoi(argv[1]);

    string text = get_string("plaintext: ");

    printf("ciphertext: ");

    for (int i = 0, len = strlen(text); i < len; i++)
    {
        printf("%c", rotate(text[i], n));
    }
    printf("\n");
}

bool only_digits(string s)
{
    for (int i = 0, len = strlen(s); i < len; i++)
    {
        if (!isdigit(s[i]))
        {
            return false;
        }
    }
    return true;
}

int rotate(char character, int n)
{
    if (isupper(character))
    {
        return 'A' + (character - 'A' + n) % 26;
    }
    else if (islower(character))
    {
        return 'a' + (character - 'a' + n) % 26;
    }
    else
    {
        return character;
    }
}
