SYS_EXIT=60
SYS_WRITE=1
.macro EXIT 
    mov $SYS_EXIT, %eax; syscall 
.endm

.section .data
str1: .asciz "David"
str2: .asciz "Thomas\n"


.section .text
.globl _start
_start:

    # 1. strlength function
    # unsigned int my_strlen(char *pointer_to_str);
    lea str1, %rdi
    call strlen

    # 2. strprint function
    lea str2, %rdi
    call strprint
    mov %rax, %rdi
    mov $SYS_EXIT, %eax
    syscall

    
    # exit
    # EXIT
