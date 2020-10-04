.globl _start
_start:
    mov $60, %eax
    mov $7, %edi
    syscall
