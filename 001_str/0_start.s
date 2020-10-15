SYS_EXIT=60
SYS_WRITE=1

.section .data
str: .asciz "David"


.section .text
.globl _start
_start:

    lea str, %rdi
    call str_len
    mov %eax, %edi
    mov $60, %eax
    syscall


    

