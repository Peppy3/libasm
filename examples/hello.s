.intel_syntax noprefix

.section .note.GNU-stack,"",@progbits


.include "libasm/string.s"
.include "libasm/io.s"


.section .rodata
hello: .asciz "Hello World!\n"


.section .text

.globl main
.type main,@function
main:
    mov rdi, hello@GOTPCREL[rip]
    call strlen

    mov rdx, rax
    mov rsi, hello@GOTPCREL[rip]
    mov edi, STDOUT_FILENO

    call write

    xor eax, eax
    ret



