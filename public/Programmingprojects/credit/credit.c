#include <stdio.h>
#include <cs50.h>

int main(void)
{
    
    long cc_number;
    long temp_cc_number;
    string card_type;
    int sum;
    int product;
    
    do
    {
        cc_number = get_long("Please insert credit card number\n");
    }
    while (cc_number < 13 && cc_number > 16);
        
    temp_cc_number = cc_number;
        
    while (cc_number > 0)
    {
        temp_cc_number = temp_cc_number / 10;
        product = (temp_cc_number%10)*2;
        sum = sum + product;
        product = 0;
    }
    printf("%i", sum);
    
}