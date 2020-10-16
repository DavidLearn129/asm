#include <stdio.h>
#include "2_strprint.h"
#include "3_strcut.h"

void strcut(char* str, unsigned char cut_len)
{
    char cut_str[cut_len+1];

    int idx=0;
    while(idx < cut_len) 
    {
        char letter = str[idx];
        cut_str[idx] = str[idx];
        idx ++;
    }
    cut_str[idx] = 0; // null terminator

    strprint(cut_str);

    return;

}
