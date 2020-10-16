#include <stdio.h>
#include "1_strlen.h"
#include "2_strprint.h"
#include "3_strcut.h"

int main(int argc, char *argv[]) 
{

    // 1. strlen function
    char* str1 = "David";
    unsigned int len = strlength(str1);

    // 2. strprint function
    char* str2 = "Thomas\n";
    strprint(str2);

    // 3. strcut function
    char* str3 = "This\n is a string.";
    char cut_len = 5;
    strcut(str3, cut_len);

}




