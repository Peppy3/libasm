.intel_syntax noprefix

.section .note.GNU-stack,"",@progbits


.include "libasm/string.s"
.include "libasm/io.s"


.section .text

/**
 * Print a number
 *
 * @rdi := number
 * @esi := unsigned = 0, signed = 1
 */
.type print_number, @function
print_number:
    push rbp
    mov rbp, rsp

    cmp esi, 1
    je .print_number.signed

    call uquad_to_ascii
    jmp .print_number.print

    .print_number.signed:
    call iquad_to_ascii

    .print_number.print:

    // replace null char with newline
    mov BYTE PTR [rax+rdx], '\n

    mov edi, STDOUT_FILENO
    mov rsi, rax
    add rdx, 1
    call write

    mov rsp, rbp
    pop rbp
    ret

.globl main
.type main, @function
main:
    mov rdi, 69
    mov esi, 0
    call print_number

    mov rdi, -420
    mov esi, 1
    call print_number

    mov rdi, 18446744073709551615
    mov esi, 0
    call print_number

    mov edi, 1
    shl rdi, 63
    mov esi, 1
    call print_number

    mov rdi, 0x7fffffffffffffff
    mov esi, 1
    call print_number

    xor eax, eax
    ret

