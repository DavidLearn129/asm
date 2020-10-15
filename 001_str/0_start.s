SYS_EXIT=60
SYS_WRITE=1

.section .data
str: .asciz "David"


.section .text
.globl _start
_start:

    # 1. strlen function
    lea str, %rdi
    call str_len
    mov %eax, %edi

    
    # exit
    mov $SYS_EXIT, %eax; syscall
