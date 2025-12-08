.intel_syntax noprefix

.include "internal.def.s"


.section .text


.globl strlen
/**
 * Gets the length of an ascii string (null char not included)
 * Analogus to stdlibc strlen
 *
 * @rdi := null terminated ascii string
 *
 * @rax := length of string
 */
proc strlen
    xor eax, eax
    
    .strlen.loop:
    movzx esi, BYTE PTR [rdi+rax]

    test esi, esi
    jz .strlen.end

    inc rax
    jmp .strlen.loop

    .strlen.end:
    ret



