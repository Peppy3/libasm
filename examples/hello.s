.intel_syntax noprefix

.section .note.GNU-stack,"",@progbits


.include "libasm/string.s"
.include "libasm/memory.s"
.include "libasm/io.s"


.section .rodata
hello: .asciz "Hello World!\n"


.section .text

.global main
.type main,@function
main:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    mov rdi, hello@GOTPCREL[rip]
    call strlen


    mov rdx, QWORD PTR [rbp-8]
    mov rsi, rax
    mov edi, STDOUT_FILENO

    call write

    xor eax, eax
    mov rsp, rbp
    pop rbp
    ret



