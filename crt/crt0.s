.intel_syntax noprefix
.section .note.GNU-stack,"",@progbits


.section .text


.globl _start
.type _start,@function
_start:
    xor ebp, ebp

    // Easier to do this before pushing on the stack
    mov rdi, QWORD PTR [rsp]
    lea rsi, [rsp+8] /* rsp + 8 to get the start of argv */

    // Set up stack frame linked list
    // (this is in fact the end of it and is denoted with zero)
    push rbp /* rip = 0 */
    push rbp /* rbp = 0 */
    mov rbp, rsp
    sub rsp, 16

    mov QWORD PTR [rbp-8], rdi
    mov QWORD PTR [rbp-16], rsi

    // Go and gather environment variables
    call __libasm_init

    mov rdi, QWORD PTR [rbp-8]
    mov rsi, QWORD PTR [rbp-16]
    mov rdx, rax

    call main

    mov edi, eax
    jmp exit_group

