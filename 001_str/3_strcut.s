strcut:
    # INPUT:
    #   rdi     -- str
    #   rsi     -- cut_len
    # LOCALS:
    #   letter  -- rcx
    #   idx     -- rdx
    # OUTPUT:
    #   (void)
    # NOTES:
    #   we are printing the string and returning nothing
    #   rather than returning the cut string, which we cannot
    #   do with an array.

    push %rbp
    mov %rsp, %rbp

    # clear registers for rcx, rdx
    xor %ecx, %ecx
    xor %edx, %edx

    # char cut_str[cut_len+1];
    # allocate an array on the stack
    sub %rsi, %rsp
    dec %rsp

    # int idx=0;
    mov $0, %rcx

  whileLoopEnter_strcut:

    # while (idx < cut_len)
    cmp %rsi, %rdx
    jge whileLoopExit_strcut

    # letter = str[idx];
    movb (%rdi, %rdx), %cl

    # cut_str[idx] = letter;
    movb %cl, (%rsp, %rdx)

    # idx ++;
    inc %rdx;

    # (implied) jump to top of loop
    jmp whileLoopEnter_strcut

  whileLoopExit_strcut:

    # cut_str[idx] = 0;
    movb %cl, (%rsp, %rdx)

    # strprint(cut_str);
    lea (%rsp), %rdi
    call strprint

    mov %rbp, %rsp
    pop %rbp

    ret
