SYS_EXIT=60
SYS_WRITE=1
.macro EXIT 
    mov $SYS_EXIT, %eax; syscall 
.endm

.section .data
str1:       .asciz "David"
str2:       .asciz "Thomas\n"
str3:       .asciz "This\n is a string."
cut_len:    .byte 5

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

    # 3. strcut function
    lea str3,       %rdi
    movzbq cut_len, %rsi
    call strcut

    EXIT
