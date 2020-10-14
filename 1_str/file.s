# Memory management with fixed length string or dynamically-allocated memory (heap)

# s=s()
# s.len()
# s.print()


# s.contains("lo")
# s.add("some more text")

SYS_EXIT=60
SYS_WRITE=1


.section .data
str:
    .asciz "Something new\n"
contains:
    .asciz "asdf"
cut_len:
    .long 7
long_str:
    .string "This is a long string here"

str_contains:
    # rdi pointer to str
    # rsi pointer to substr


    # # Example implementation in C
    # for (int i=0; str[i] != '\0'; i++) {
        # for (int j=0; substr[j] != '\0'; j++) {
            # if (str[i+j] == '\0') goto nextOuter;
            # if (str[i+j] != substr[j]) {
                # goto nextOuter;
            # }
        # }
        # return idx; 
        # nextOuter:;
    # }
    # return -1;


    # TRANSLATING variabels
    # i is %rdx
    # j is %rcx
    xor %rdx, %rdx # i = 0
    
  outerLoop:
    cmpb $0, (%rdi, %rdx) # dont forget -- these are memory addresses, 64 bits not edi !
    je outerLoopExit

    xor %rcx, %rcx # j = 0

    innerLoop:
        cmpb $0, (%rsi, %rcx) # substring
        je innerLoopExit

        mov %rdx, %rax # mov i, rax
        add %rcx, %rax # add j, rax
        movb (%rdi, %rax), %al
        test %al, %al
        jz nextOuter
        cmpb %al, (%rsi, %rcx)
        jne nextOuter
        inc %rcx
        
        jmp innerLoop

  innerLoopExit: # last thing in the inner loop expansion
    mov %rdx, %rax
    jmp funcExit

   nextOuter:
    inc %rdx # outer loop expansion
    jmp outerLoop

  outerLoopExit: # end of the outerloop
    mov $-1, %rax
    
  funcExit: 
    ret
               
cut_string:

    # we can do this with a syscall to write, but let's practice while loops

    # PARAMS
    # rdi       -- pointer to string
    # rsi       -- length to cut to

    # LOCAL
    # rcx       -- current index
    # rdx       -- current letter

    # 1. Reserve space for the new_string on the stack
    push %rbp
    mov %rsp, %rbp

    sub %rsi, %rsp
    dec %rsi
    movb $0, -1(%rbp)    # null-terminate it

    # int idx=0;
    mov $0, %rcx

  whileTop:

    # while index <= CUT_LENGTH;
    cmp %rsi, %rcx
    jge whileExit

    # char letter = string[index];
    movb (%rdi, %rcx), %dl

    # if (letter == '\0') break;
    cmpb $0, %dl
    jz whileExit

    # new_string[index] = letter;
    movb %dl, (%rsp, %rcx)

    # idx ++;
    inc %rcx

    jmp whileTop

  whileExit:

    # just to test -- let's print it to see
    mov %rsp, %rdi
    call str_print

    mov %rbp, %rsp
    pop %rbp
    ret
    # mov %rsp, %rbp


    

.section .text
.globl _start
_start:

    lea long_str, %rdi
    mov cut_len, %esi   # cut_len is an int
    call cut_string

    # lea str,        %rdi
    # lea contains,   %rsi 
    # call str_contains
    # lea str, %rdi
    # call str_print
    # call str_len

    # for now, just return the length of the string to see the program is 'working'
    mov %rax, %rdi
    mov $SYS_EXIT, %eax
    syscall

str_len:
    # pointer to str in %rdi, size in %eax
    # display/1cb $rdi+$rax
    xor %eax, %eax  # zero-pad high 32 bits
  cnt_letter:
    cmp $0, (%rdi, %rax)
    jz end_cnt
    inc %rax
    jmp cnt_letter
  end_cnt:
    ret

    

str_print:
    # IN: rdi --> pointer to the string

    # choices: fwrite, printf, write, etc.
    # C   - fwrite - can print to any device (open file, stdout), need to know len
    # C   - fprintf - can print to any device, can print to any device, uses a format string
    # C   - puts - writes a string
    # C   - fputs - writes a string, can print to any device
    # SYS - write - takes a file handle can print to any output
    # dianes silk dress costs 89 dollars
    # C   - printf - printf("Hello %s", "something");, assumes stdout
    # rdi = "Hello %s %x %d";
    # rsi = "Something"
    # rdx = 4;

    pushq %rdi  # push/pop allows us to call an unknown str_len where it MAY destroy rdi

    # call -- push rip + len instruction
    #      -- rip = str_len
    call str_len

    mov %rax,        %rdx # move the string length
    mov $SYS_WRITE,  %eax
    mov $1,          %edi
    popq %rsi
    # fwrite
    syscall # returns length of the written string

    # ret -- pop rip 
    ret


# for ( int i = 0; i < N; i++ ) {
   # <for-body>
# }

# ---

# int i = 0;
# while ( i < N ) {
  # <for-body>
  # i++;
# }

# ---

    # int i = 0;
# whileTop:
    # if ( i >= N ) goto whileExit;
    # int j = 0;
# whileTop2:
    # if ( j >= N ) goto whileExit2;
    # <inner-for-body>
    # j++;
    # goto whileTop2;
# whileExit2:
    # i++;
    # goto whileTop;
# whileExit:


