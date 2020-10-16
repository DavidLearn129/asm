strprint:
    # INPUT:
    #   rdi     -- str
    # OUTPUT:
    #   eax     -- len of str that was printed
    # NOTES:
    #   

    # len = strlength(str)
    push %rdi       # save rdi in case the function modifies the value
    call strlen

    # syscall(SYS_WRITE, 1, str, len);
    mov %eax, %edx  #  write: rax=1, rdi=1, rsi=str, rdx=len
    pop %rsi
    mov $1, %edi
    mov $SYS_WRITE, %eax
    syscall

    # return len 
    # (note WRITE syscall already returns this so superfluous)
    mov %edx, %eax

    ret
