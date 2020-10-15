str_len:
    # INPUT:
    #   rdi   -- 'pointer_to_string'
    # OUTPUT:
    #   rdx   -- 'len' variable, starts at 0 and increments until '\0'
    # NOTES:
    #   to print the curent char being examined in gdb: 
    #   $ display/1cb $rdi+$rax

    # unsigned int len = 0;
    mov $0, %rax

  whileLoopEnter:

    # pointer_to_str[len] != '\0
    cmp $0, (%rdi, %rax)
    jz whileLoopExit

    # len ++;
    inc %eax

    # (implied) jump back to top of loop
    jmp whileLoopEnter

  whileLoopExit:
    
    # return len
    ret
