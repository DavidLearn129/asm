#include <stdio.h>
#include "1_strlen.h"

int main(int argc, char *argv[]) {

    // 1. strlen function
    char* str = "David";
    unsigned int len = my_strlen(str);
    printf("String: '%s'\nLength: %d\n", str, len);

}




