.intel_syntax noprefix

.include "internal.def.s"


.section .data
.align 8
environ:
.quad 0

.section .text


.globl getenv
/**
 * Gets an environment variable from the environment passed in rdi
 * 
 * @rdi := environment vector
 * @rsi := address to null terminated variable name to search for
 * 
 * @rax := address to null terminated value in the environment vector.
 *         null address if not found
 */
proc getenv
    push rbx
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov QWORD PTR [rbp-8], rdi
    mov QWORD PTR [rbp-16], rsi

    mov rdi, rsi
    call strlen

    mov QWORD PTR [rbp-16], rax

    xor ebx, ebx

    .getenv.loop:

    mov rdi, QWORD PTR [rbp-8]
    mov rax, QWORD PTR [rdi+rbx*8]
    add rbx, 1

    // If rax is null, then we have reached the end of environ
    // and we should return from this function (with null)
    test rax, rax
    jz .getenv.end

    mov QWORD PTR [rbp-24], rax

    mov rdi, rax
    mov esi, '=
    call strlen_delim
    
    mov QWORD PTR [rbp-32], rax

    // do not compare if the two strings does not have the same length
    mov rsi, QWORD PTR [rbp-16]
    cmp rsi, rax
    jne .getenv.loop:

    mov rdx, rax
    mov rdi, QWORD PTR [rbp-24]

    call strncmp
    
    cmp eax, 0
    jne .getenv.loop

    // we have the correct environ

    mov rdi, QWORD PTR [rbp-32]

    mov rax, QWORD PTR [rbp-24]

    lea rax, [rax+rdi+1]

    .getenv.end:

    mov rsp, rbp
    pop rbp
    pop rbx
    ret

