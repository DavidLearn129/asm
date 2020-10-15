unsigned int my_strlen(char* pointer_to_str) {
    unsigned int len = 0;
    while (pointer_to_str[len] != '\0') {
        len ++;
    }
    return len;
}


