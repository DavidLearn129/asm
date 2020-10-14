#include <stdio.h>
int main(void) {

    // Function to cut a string
    char * string = "This is a long string here";
    int CUT_LENGTH = 10;
    char new_string[CUT_LENGTH+1]; // null-terminate
    new_string[CUT_LENGTH+1] = '\0';

    int index=0;
    while (index <= CUT_LENGTH) {
        char letter = string[idx];
        if (letter == '\0') break;
        new_string[index] = letter;
        index++;
    }

    printf("Cut string: %s\n", new_string);
    return 0;
}
