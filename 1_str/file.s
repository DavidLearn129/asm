SYS_EXIT=60

.section .data
str:
    .asciz "Hello"

.section .text
.globl _start
_start:
    lea str, %rdi
    call str_len

    # for now, just return the length of the string to see the program is 'working'
    mov %eax, %edi
    mov $SYS_EXIT, %eax
    syscall

str_len:
    # pointer to str in %rdi, size in %eax
    # display/1cb $rdi+$rax
    xor %eax, %eax
  cnt_letter:
    cmp $0, (%rdi, %rax)
    jz end_cnt
    inc %rax
    jmp cnt_letter
  end_cnt:
    ret
