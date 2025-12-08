.intel_syntax noprefix

.include "internal.def.s"


.section .text


.globl strncmp
/**
 * Compares two strings and gives the difference between them
 * Analogus to stdlibc strncmp
 *
 * @rdi := lhs
 * @rsi := rhs
 * @rdx := compare length
 *
 * @eax := difference between the two strings (given as signed 32 bit value)
 */
proc strncmp
    xor ecx, ecx

    .strncmp.loop:
    cmp rcx, rdx
    jge .strncmp.loop_end

    movsx eax, BYTE PTR [rdi+rcx]
    movsx r8d, BYTE PTR [rsi+rcx]
    inc rcx

    test eax, eax
    jz .strncmp.loop_end
    
    test r8d, r8d
    jz .strncmp.loop_end

    cmp eax, r8d
    je .strncmp.loop

    .strncmp.loop_end:
    sub eax, r8d
    ret
