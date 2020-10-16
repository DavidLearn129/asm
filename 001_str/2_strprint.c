// unistd defines the posix system calls
#include <unistd.h>
#include "1_strlen.h"
#include "2_strprint.h"
#define SYS_WRITE 1

unsigned int strprint(char *str)
{

    unsigned int len = strlength(str);
    syscall(SYS_WRITE, 1, str, len);

    return len;

}

