#include <stdio.h>
#include "1_strlen.h"
#include "2_strprint.h"

int main(int argc, char *argv[]) 
{

    // 1. strlen function
    char* str1 = "David";
    unsigned int len = strlength(str1);

    // 2. strprint function
    char* str2 = "Thomas\n";
    strprint(str2);


}




